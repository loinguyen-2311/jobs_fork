# frozen_string_literal: true

class SendToEmailMarketingWorker
  include Sidekiq::Worker

  def perform
    ['Ruby', '.Net', 'Test', 'Fullstack', 'Java', 'Database', 'Designer', 'Blockchain', 'Reactjs', 'NodeJS',
     'Manager'].each do |keyword|
      job_by_keywords = Job.where(status: 2).filter_by_title(keyword)
      EmailMarketing.developer_with_job_title(keyword).pluck(:email).uniq.each do |email_by_keyword|
        begin
          JobMailer.send_to_email_marketing_email(job_by_keywords, email_by_keyword).deliver_now
        rescue Exception => e # Never do this!
          print e
        end
      end
    end
  end
end
