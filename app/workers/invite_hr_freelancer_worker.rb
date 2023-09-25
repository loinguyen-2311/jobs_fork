class InviteHrFreelancerWorker
  include Sidekiq::Worker

  def perform
    EmailMarketing.all.map { |item| HrFreelancerMailer.invite_hr_freelancer(item.email).deliver_now }
  rescue Exception => e # Never do this!
    print e
  end
end
