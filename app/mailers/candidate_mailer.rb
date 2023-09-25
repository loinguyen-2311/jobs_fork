class CandidateMailer < ApplicationMailer
  def notify_applied_job
    emails = Cv.pluck(:email)
    mail to: [emails, "nguyenvanhuan243@gmail.com"].flatten!, subject: '[DevFinding] - Chúc Mừng Bạn Đã Ứng Tuyển Thành Công'
  end
end

# Run email: CandidateMailer.notify_applied_job.deliver_now
