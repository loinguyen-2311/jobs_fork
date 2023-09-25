# ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@devfinding.com'
  layout 'mailer'
end
