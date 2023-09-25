# Show parent class => EmailFormatValidator.ancestors
class EmailFormatValidator < ActiveModel::Validator
  def validate(record)
    if (record.email =~ URI::MailTo::EMAIL_REGEXP).nil? || (User::NOT_ALLOWED_EMAIL_CHARS & record.email.split('')).present?
      record.errors.add(:email, 'Invalid email format')
    end
  end
end
