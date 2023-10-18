class Job < ApplicationRecord
  # == Extensions ===========================================================
  include Filterable
  include PgSearch::Model
  extend FriendlyId
  extend Enumerize

  # == Validations ===========================================================
  validates :job_type, presence: true

  # == Attributes ===========================================================
  enum status: {
    pending: 1,
    going: 2,
    expired: 3,
    closed: 4
  }

  enum sync_from_partner: {
    fiojob: 0,
    dtalent: 1
  }

  enum job_type: { normal: 0, lua_ga: 1 }

  friendly_id :title, use: :slugged # friendly_id

  # == Relationships ========================================================
  belongs_to :user
  has_many :applied_jobs
  has_many :cvs, dependent: :destroy

  # == Scopes ===============================================================
  # chỉ sử dụng được cho Postgres, tối độ chậm hơn sope sử dụng LIKE
  scope :search_by_title, -> (query) {
    where("title ILIKE :query", query: "%#{query}%")
  }

  # scope :search_by_title, -> (query) {
  #   where("LOWER(title) LIKE :query", query: "%#{query.downcase}%")
  # }

  scope :filter_by_status, lambda { |status|
    where(status: status)
  }
  scope :filter_by_have_cv, lambda { |have_cv|
    joins(:cvs) if [true, 'true'].include?(have_cv)
  }
  scope :filter_by_keyword, lambda { |job_status|
    where(status: job_status)
  }
  scope :filter_by_sync_from_partner, lambda { |sync_from_partner|
    where(sync_from_partner: sync_from_partner)
  }
  scope :active_job_from_dtalent, lambda {
    dtalent.going.normal
  }

  scope :dtalent_remote, lambda {
    where("status = #{Job.statuses[:going]} AND sync_from_partner = #{Job.sync_from_partners[:dtalent]}").where('title iLIKE ?', '%remote%')
  }
  scope :filter_by_title, lambda { |title|
    where('title iLIKE ?', "%#{title}%")
  }
  scope :filter_by_category, lambda { |category|
    where(category: category)
  }
  scope :dev_group_jobs, Jobs::DevGroupJobQuery

  scope :filter_by_commission, lambda { |commission|
    Jobs::CommissionJobQuery.call(commission: commission)
  }
  scope :filter_by_location, lambda { |location|
    Jobs::LocationJobQuery.call(location: location)
  }
  pg_search_scope :search_job,
                  against: [:title],
                  ignoring: :accents,
                  using: {
                    tsearch: {
                      tsvector_column: 'search_tsvector',
                      prefix: true
                    }
                  },
                  order_within_rank: 'jobs.updated_at DESC'

  # == CallBacks ===============================================================
  before_create :set_status
  after_commit -> { update_default_company_logo }
  after_commit :remove_cache_feature_jobs, on: %i[create update]
  after_commit :remove_jobs_count_number, on: %i[create update]

  # == Instant Methods ===============================================================
  def update_default_company_logo
    company_logo = 'https://devfinding-production.s3.ap-southeast-1.amazonaws.com/default_company_logo.png' unless company_logo.present?
  end

  def should_generate_new_friendly_id?
    title_changed? || super
  end

  def set_status
    Job.statuses[:pending]
  end

  def remove_cache_feature_jobs
    Rails.cache.delete 'feature_jobs'
  end

  def remove_jobs_count_number
    Rails.cache.delete 'jobs_count_number'
  end

  # == Class Methods ===============================================================
  def self.count_job(title, location)
    active_job_from_dtalent.where('province iLIKE ?', "%#{location}%").where('title iLIKE ?', "%#{title}%").size
  end

  def self.consultant_commission(commission)
    return nil if commission.nil?
    return "#{commission.scan(/\d+/).first.to_i / 2}% Lương" if commission.include?('%')

    (commission.scan(/\d+/).first.to_i / 2).to_s + ' Triệu'
  end

  def self.show_remote_menu
    ActiveRecord::Base.connection.execute("SELECT * FROM jobs WHERE status = 2 AND title iLIKE '%remote%'").values.present?
  end

  def self.tag_list
    [
      'Ruby',
      'PHP',
      'Android',
      'Wordpress',
      'Laravel',
      'Blockchain',
      'IOS',
      'C++',
      'Solidity',
      'Rust',
      'Remote',
      'VueJS',
      'ReactJS'
    ]
  end

  def self.job_locations
    ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng', 'Huế']
  end

  def self.feature_jobs
    Rails.cache.fetch('feature_jobs', expires_in: 12.hours) do
      active_job_from_dtalent.select(:title, :company_logo, :province, :created_at, :salary_text, :category, :id,
                                     :updated_at, :slug).take(6)
    end
  end

  def self.jobs_count_number
    Rails.cache.fetch('jobs_count_number', expires_in: 12.hours) do
      results = ActiveRecord::Base.connection.execute('SELECT COUNT(*) FROM jobs')
      job_number_to_marketing = Random.rand(8000...19_000)
      results.to_a.first['count'] + job_number_to_marketing
    end
  end
end
