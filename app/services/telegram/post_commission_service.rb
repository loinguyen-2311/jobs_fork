class Telegram::PostCommissionService
  def self.post_commission_freelancer
    formated_job_title = []
    Job.active_job_from_dtalent.pluck(:title, :commission, :id).each_with_index do |job_title, _index|
      unless job_title[1].include?('%')
        commission = job_title[1].scan(/\d+/).first.to_i / 2
        if commission > 9
          commission = "🤑🤑#{NumberFormatter.format(commission)}.0️⃣0️⃣0️⃣.0️⃣0️⃣0️⃣ VND 🤑🤑"
          id = job_title[2]
          job_link = "https://devfinding.com/single_job/#{id}"
          text = "🔥🔥🔥 👉Nhận Hoa Hồng Ngay #{commission} 🔥 Khi giới thiệu thành công vị trí #{job_title[0]} 👉👉 #{job_link}"
          formated_job_title.push(text)
        end
      end
    end

    formated_job_title.push('🔥🔥🔥🔥Xem Danh Sách 👉👉https://devfinding.com/hr_freelancer_jobs?title=&location=&commission=10 🔥🔥🔥🔥')
    formated_job_title.push('Đăng kí Kiếm Tiền 👉 https://devfinding.com/hr_freelancers/sessions/signup')

    formated_job_title.each do |job|
      body = { chat_id: '-1001716621158', text: job }
      HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: body.to_json,
                                                  headers: { 'content-type' => 'application/json' }).parsed_response
    end

    formated_job_title.each do |job|
      body = { chat_id: '-1001759328259', text: job }
      HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: body.to_json,
                                                  headers: { 'content-type' => 'application/json' }).parsed_response
    end
  end
end
