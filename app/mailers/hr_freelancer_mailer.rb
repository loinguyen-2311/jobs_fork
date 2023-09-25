# ModelMailer
class HrFreelancerMailer < ApplicationMailer
  def invite_hr_freelancer(email)
    mail to: email, subject: 'Thư Mời Tham Gia Cộng Tác Viên'
  end

  def congrs_hr_freelancer(email)
    mail to: email, subject: 'Thư Mời Chúc Mừng Cộng Tác Viên'
  end

  def notify_new_hr_freelancer
    email = "nguyenvanhuan243@gmail.com"
    mail to: email, subject: 'Thông Báo Có HR Freelancer Mới Đăng Kí'
  end

  def send_commission_jobs_hr_freelancer(hr_freelancer_email)
    mail to: hr_freelancer_email, subject: 'Danh Sách Công Việc Hoa Hồng Cao Cho HR Freelancers'
  end

  def send_email_for_leader(leader_email)
    mail to: leader_email, subject: '[Devfinding Leader] - Thông Báo Có Ứng Viên Mới Ứng Tuyển'
  end
end
