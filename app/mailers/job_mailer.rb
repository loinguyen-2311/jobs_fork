# JobMailer
class JobMailer < ApplicationMailer
  ADMIN_EMAIL = [ 'nguyenvanhuan243@gmail.com' ]
  def notify_candidate_apply_job(job)
    @job = job
    mail to: ADMIN_EMAIL, subject: 'Thông báo ứng viên apply job.'
  end

  def send_to_email_marketing_email(jobs, email_marketings)
    @jobs = jobs
    mail to: email_marketings, subject: 'Mời Bạn Tham Khảo Các Công Việc Phù Hợp Với Kĩ Năng Của Bạn Nhé!'
  end

  def email_testing
    mail to: "nguyenvanhuan243@gmail.com", subject: 'This is email testing'
  end

end
