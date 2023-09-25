class EmailMarketing < ApplicationRecord
	# == Validations ===========================================================
	validates :email, presence: true, uniqueness: true

	# == Class Methods ===========================================================
	def self.developer_with_job_title(job_title)
		where('job_title iLIKE ?', "%#{job_title}%")
	end

	def test_send_email
		sender = "DevFinding"
		from_email = "no-reply@devfinding.com"
		receiver_email = "huan.nguyen.dev2022@gmail.com" # change Nguyen's email
		email_info = {
			to: receiver_email,
			from: from_email,
			sender: sender
		}
    placeholders = {}
    template_id  = "d-70e777e176c04a4f862eb1f8f142670a"
    SendgridMailer.new(email_info, template_id, placeholders, nil, nil, nil, nil).send
	end
end
