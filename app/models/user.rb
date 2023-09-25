# frozen_string_literal: true
class User < ApplicationRecord
  # == Extensions ===========================================================
  extend Enumerize
  include Filterable

  # == Constants ===========================================================
  NOT_ALLOWED_EMAIL_CHARS = %w[` ~ ! # $ % ^ & * ( ) + = { [ ] } \ | : ; " ' < , > / ?]

  # == Attributes ===========================================================
  enum user_type: {
    candidate: 1,
    recruiter: 2,
    consultant: 3,
    admin: 4,
    hr_freelancer: 5
  }

  # == Validations ==========================================================
  validates :email, uniqueness: true
  validates :referral_code, presence: true
  validates :referral_code, uniqueness: true
  do_not_validate_attachment_file_type :avatar
  has_attached_file :avatar, styles: { medium: '400x400>', thumb: '200x200>' },
                             default_url: '/images/:style/missing.png'
  validates_with EmailFormatValidator, on: :create
  
  # == Relationships ========================================================
  has_many :jobs, dependent: :destroy

  # == Scopes ===============================================================
  scope :filter_by_user_type, lambda { |user_type|
    where(user_type: user_type)
  }

  # == Callbacks ============================================================
  before_create :confirmation_token
  before_create { generate_token(:auth_token_reset) }
  after_create_commit :generate_referral_code

  # == Instant Methods ========================================================
  def email_activate
    self.activated = 1
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
    ModelMailer.wellcome_email(self)
  end

  def forgot_password
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    RegisterMailer.password_reset(self).deliver_now
  end

  def avatar_url
    base_url + avatar.url
  end

  def reset_password_link
    "#{Rails.env == 'production' ? 'https://devfinding.com' : 'http://localhost:3000'}/hr_freelancers/sessions/#{password_reset_token}/new_password"
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def generate_token(column)
    user_existing = User.exists?(column => self[column])
    self[column] = SecureRandom.urlsafe_base64 if user_existing
  end

  def generate_referral_code
    self.referral_code = "DevFinding#{SecureRandom.urlsafe_base64}#{self.id}".upcase
  end

end
