# frozen_string_literal: true

require 'sendgrid-ruby'
require 'sentry-ruby'

include SendGrid
class SendgridMailer
  def initialize(email_info = {}, template_id = nil, placeholders = {}, attachments = nil, ics = nil, categories = [],
                 send_at = nil)
    from_email = email_info[:from] || EMAIL::DEFAULT_FROM_EMAIL
    from_name = email_info[:name] || email_info[:sender] || EMAIL::DEFAULT_FROM_NAME
    reply_email = email_info[:reply_email] || 'support@devfinding.com'
    reply_email_name = email_info[:reply_email_name] || 'DevFinding Customer Supporter'
    @from = SendGrid::Email.new(email: from_email, name: from_name)
    @reply_to = SendGrid::Email.new(email: reply_email, name: reply_email_name)
    @email_info = email_info
    @template_id = template_id
    @placeholders = placeholders.merge(default_placeholders)
    @send_at = send_at
    @personalization = SendGrid::Personalization.new
    to_emails = prepare_email(email_info[:to])
    cc_emails = prepare_email(email_info[:cc])
    bcc_emails = prepare_email(email_info[:bcc])

    # Unique email addresses
    cc_emails -= to_emails
    bcc_emails -= to_emails

    to_emails.each { |to_email| @personalization.add_to(SendGrid::Email.new(email: to_email)) }
    cc_emails.each { |cc_email| @personalization.add_cc(SendGrid::Email.new(email: cc_email)) }
    bcc_emails.each { |bcc_email| @personalization.add_bcc(SendGrid::Email.new(email: bcc_email)) }

    @attachments = attachments
    @ics = ics
    @categories = categories
  end

  def send
    mail = SendGrid::Mail.new
    mail.template_id = @template_id
    mail.from = @from
    mail.reply_to = @reply_to
    @personalization.add_dynamic_template_data(@placeholders)
    mail.add_personalization(@personalization)
    if @attachments.present?
      @attachments.each do |attachment|
        att = SendGrid::Attachment.new
        att.content = Base64.strict_encode64(attachment.file.read)
        att.type = attachment.file.content_type
        att.filename = attachment.file.identifier
        mail.add_attachment(att)
      end
    end
    if @ics.present?
      att = SendGrid::Attachment.new
      att.content = Base64.strict_encode64(@ics.to_ical.to_s)
      att.type = 'text/calendar'
      att.filename = 'invite.ics'
      mail.add_attachment(att)
    end
    if @categories.present?
      @categories.each do |category|
        cate = SendGrid::Category.new
        cate.name = category
        mail.add_category(cate)
      end
    end
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    if response && response.status_code.to_i != SENDGRID_CODE::ACCEPTED
      ::Sentry.capture_message("SENDING EMAIL BY SENDGRID: #{response.parsed_body[:errors].first[:message]}")
      raise(ExceptionHandler::SendEmailUnsuccessfully, response.parsed_body[:errors].first[:message].to_s)
    end
    response
  end

  private

  def prepare_email(emails)
    emails = emails.presence || []
    emails = [emails] if emails.is_a?(String)
    emails
  end

  def default_placeholders
    {
      SUPPORT_EMAIL: 'no-reply@devfinding.com',
      SIGNATURE: 'nguyenvanhuan243@gmail.com',
      COPYRIGHT_NAME: 'DevFinding Exchange'
    }
  end
end
