class DtalentSyncJobService
  def initialize(job_id = nil)
    # Code here
  end

  def commission
    jobs = Job.where(
      status: Job.statuses[:going],
      category: 'Software Engineering',
      sync_from_partner: Job.sync_from_partners[:dtalent]
    )
    formated_job_title = []
    jobs.pluck(:title, :commission, :id).each_with_index do |job_title, index|
      if job_title[1].include?('%')
        partner_commission = "#{job_title[1].scan(/\d+/).first.to_i / 2}% Lương"
        text = "#{index + 1}: #{job_title[0]} - Hoa Hồng Cộng Tác Viên: #{partner_commission} 👉 https://#{ENV['DOMAIN']}/single_job/#{job_title[2]}"
      else
        partner_commission = job_title[1].scan(/\d+/).first.to_i / 2
        text = "#{index + 1}: #{job_title[0]} - Hoa Hồng Cộng Tác Viên: #{partner_commission} triệu 👉 https://#{ENV['DOMAIN']}/single_job/#{job_title[2]}"
      end
      formated_job_title.push(text)
    end
    formated_job_title
  end

  def full_commission
    jobs = Job.where(
      status: Job.statuses[:going],
      category: 'Software Engineering',
      sync_from_partner: Job.sync_from_partners[:dtalent]
    )
    formated_job_title = []
    jobs.pluck(:title, :commission, :id).each_with_index do |job_title, _index|
      formated_job_title.push("Hoa Hồng #{job_title[1]}: 👉 https://#{ENV['DOMAIN']}/single_job/#{job_title[2]}")
    end
    formated_job_title
  end

  def full_commission_having_sync_job
    sync_job
    full_commission
  end

  def job_title(params)
    sync_job
    jobs = Job.where(
      status: Job.statuses[:going],
      sync_from_partner: Job.sync_from_partners[:dtalent]
    )
    jobs = jobs.where('title iLIKE ?', "%#{params[:title]}%") if params[:title].present?
    formated_job_title = []
    jobs.each_with_index do |job, _index|
      formated_job_title.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://#{ENV['DOMAIN']}/single_job/#{job.id}")
    end
    formated_job_title
  end

  # remote_job_title
  def remote_job_title
    formated_job_title = []
    Job.active_job_from_dtalent.each do |job|
      if job.title.downcase.include?('remote')
        formated_job_title.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://#{ENV['DOMAIN']}/single_job/#{job.id}")
      end
    end
    formated_job_title
  end

  def sync_job
    # Cập nhật tất cả các công việc được đồng bộ từ đối tác có sync_from_partner = dtalent
    Job.where(sync_from_partner: Job.sync_from_partners[:dtalent]).update_all(status: Job.statuses[:closed])

    # Gửi yêu cầu POST đến URL đối tác để lấy danh sách công việc
    response = HTTParty.post('https://dtalent.dev/rms/apis/index.php?m=home', body: { tokenID: ENV['DTALENT_ACCESS_TOKEN'] })

    # Kiểm tra xem yêu cầu thành công và có dữ liệu trả về không
    if response.code == 200 && (data = JSON.parse(response.body)['data'])
      user_id = User.find_or_create_by(email: 'nguyenloi.dev@gmail.com') { |user| user.referral_code = '10000' }.id

      # Xử lý danh sách công việc
      job_list = [data['hotjobs'], data['fulljobs']].flatten.compact
      job_list.each do |job_data|
        # next unless job_data['commission'].present?

        job_attrs = {
          user_id: user_id,
          description: job_data['jobDescription'],
          requirement: job_data['jobDescription'],
          benifit: job_data['jobDescription'],
          hot_job: job_data['isHot'],
          title: job_data['title'],
          salary_text: job_data['salary'],
          category: job_data['jobCategory'],
          province: job_data['city'],
          state: job_data['state'],
          commission: job_data['commission'],
          sync_from_partner: Job.sync_from_partners[:dtalent],
          status: Job.statuses[:going],
          company_logo: job_data['companyLogo'],
          job_type: Job.job_types[:normal]
        }

        job = Job.find_or_initialize_by(id: job_data['jobOrderID'])
        job.update(job_attrs)
        job.save!
      end
    end
  end

  def job_list(params)
    Job.filter(params).active_job_from_dtalent
  end
end
