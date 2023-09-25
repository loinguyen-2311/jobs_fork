class GithubEmailMarketing < ApplicationRecord
  # == Validations ===========================================================
  validates :email, presence: true
  validates :email, uniqueness: true

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :job_title, presence: true
end
