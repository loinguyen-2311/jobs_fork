class Telegram::LuaGaJob::PostToDevGroupService
  def self.call
    formated_job_title = []
    jobs = Job.lua_ga
    return if jobs.size == 0

    jobs.map do |job|
      formated_job_title.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://devfinding.com/single_job/#{job.id}")
    end
    text = <<~MARKDOWN
      Chúng Tôi Xin Gửi Danh Sách Các Công Việc Cho Các Bạn Tham Khảo 🔥

      *Mời Bạn Xem Việc Nhé*

      #{formated_job_title.map { |item| "- #{item}" }.join("\n\n")}

      👉👉 Nếu Có Bạn Đang Tìm Việc Hãy Giới Thiệu Chúng Tôi Nhé.
      Hoa hồng lên tới 20.000.000 VND/giới thiệu 🔥🔥

      👉 Đăng kí cộng tác viên: https://devfinding.com/hr_freelancers/sessions/signup

      👉 Tham gia Facebook: https://www.facebook.com/groups/devfinding

      👉 Nhóm cộng tác viên: https://t.me/congtacvienjob
    MARKDOWN

    HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: { chat_id: '-1001842175925', text: text }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response
  end
end
