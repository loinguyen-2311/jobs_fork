# frozen_string_literal: true

class SendGridEmailComposer
  def initialize(payload = {})
    @payload = payload.deep_symbolize_keys!
    @template_id = payload[:template_id]
    @attachments = payload.fetch(:attachments, [])
    @to = payload.fetch(:to, [])
    @cc = payload.fetch(:cc, []) - to
    @bcc = payload.fetch(:bcc, []) - to - cc
  end

  def perform
    {
      from: retrieve_data_by(:from),
      reply_to: retrieve_data_by(:reply_to),
      template_id: template_id,
      attachments: attachments,
      personalizations: [personalizations]
    }.compact_blank
  end

  private

  attr_reader :payload, :template_id, :attachments, :to, :cc, :bcc

  def retrieve_data_by(type)
    email = payload.dig(type, :email) || ENV.fetch("DEFAULT_EMAIL_#{type.upcase}", nil)
    name = payload.dig(type, :name) || ENV.fetch("DEFAULT_NAME_#{type.upcase}", nil)

    return {} unless email

    {
      email: email,
      name: name
    }
  end

  def personalizations
    {
      to: array_to_hash(to),
      cc: array_to_hash(cc),
      bcc: array_to_hash(bcc),
      dynamic_template_data: payload.fetch(:dynamic_template_data, {})
    }.compact_blank
  end

  def array_to_hash(emails)
    emails.map { |email| { email: email } }
  end
end
