class Cv < ApplicationRecord
  # == Extensions ===========================================================
  include Filterable
  extend Enumerize

  # == Attributes ===========================================================
  enum status: {
    newly: 1,
    reviewing: 2,
    sent_to_dtalent: 3,
    done: 5,
    update_cv_again: 7,
    need_more_experiences: 8,
    candidate_rejected: 9
  }

  # == Validations ==========================================================
  has_attached_file :file
  validates_attachment :file, presence: true # content_type: { content_type: "application/pdf" }
  do_not_validate_attachment_file_type :file

  # == Validators Partern ==========================================================
  validates_with EmailFormatValidator, on: :create

  # == Relationships ========================================================
  belongs_to :job

  # == Scopes ===============================================================
  scope :filter_by_sync_from_partner, lambda { |sync_from_partner|
    joins(:job).where("jobs.id = cvs.job_id AND jobs.sync_from_partner = #{sync_from_partner == 'dtalent' ? 1 : 2}")
  }

  scope :filter_by_job_id, lambda { |job_id|
    where(job_id: job_id)
  }

  scope :filter_by_status, lambda { |status|
    where(status: status)
  }

  # == Instant Methods ===============================================================
  def cv_url
    file.url[2..-1]
  end
end
