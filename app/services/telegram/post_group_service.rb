class Telegram::PostGroupService
  def self.call(group_type)
    group_type == 'dev' ? dev_group : partner_group
  end

  def self.dev_group
    formated_job_title = []
    jobs = Job.dev_group_jobs
    return ActiveRecord::Base.connection.execute('update jobs set sent_job = false') if jobs.count == 0

    jobs.update_all(sent_job: true)
    jobs.map do |job|
      formated_job_title.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://devfinding.com/single_job/#{job.id}")
    end
    return if formated_job_title.size == 0

    text = <<~MARKDOWN
      🔥 Chúng Tôi Xin Gửi Danh Sách Các Công Việc Cho Các Bạn Tham Khảo 🔥 🔥

      *Mời Bạn Xem Việc Nhé*

      #{formated_job_title.map { |item| "- #{item}" }.join("\n\n")}

      👉 👉 Nếu Có Bạn Đang Tìm Việc Hãy Giới Thiệu Chúng Tôi Nhé.
      Hoa hồng lên tới 20.000.000 VND/giới thiệu 🔥🔥

      👉 Đăng kí cộng tác viên: https://devfinding.com/hr_freelancers/sessions/signup

      👉 Tham gia Facebook: https://www.facebook.com/groups/devfinding

      👉 Nhóm cộng tác viên: https://t.me/congtacvienjob

    MARKDOWN
    HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: { chat_id: '-1001842175925', text: text }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response
    jobs.update_all(sent_job: false) if jobs.count < 5
  end

  def self.partner_group
    formated_job_title = []
    Job.active_job_from_dtalent.where(category: 'Software Engineering').pluck(:title, :commission,
                                                                              :id).each_with_index do |job_title, index|
      if job_title[1].include?('%')
        partner_commission = "#{job_title[1].scan(/\d+/).first.to_i / 2}% Lương"
        text = "#{index + 1}: #{job_title[0]} - Hoa Hồng Cộng Tác Viên: #{partner_commission} 👉 https://devfinding.com/hr_freelancers_job/#{job_title[2]}"
      else
        partner_commission = job_title[1].scan(/\d+/).first.to_i / 2
        text = "#{index + 1}: #{job_title[0]} - Hoa Hồng Cộng Tác Viên: #{partner_commission} triệu 👉 https://devfinding.com/hr_freelancers_job/#{job_title[2]}"
      end
      formated_job_title.push(text)
    end
    return if formated_job_title.size == 0

    text = <<~MARKDOWN
      🔥🔥Danh Sách Các Công Việc Đang Tuyển Và Hoa Hồng Cộng Tác Viên 🔥🔥

      *Mời Bạn Xem Việc:*
      #{formated_job_title.map { |item| "- #{item}" }.join("\n\n")}

      👉 Mọi thắc Mắc liên hệ Admin: https://t.me/anhbitcoin

    MARKDOWN
    HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: { chat_id: '-1001716621158', text: text }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response
  end

  # Markdown
  def self.post_group_telegram(group_id, text)
    HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: { chat_id: group_id, text: text, parse_mode: 'Markdown' }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response
  end
end
