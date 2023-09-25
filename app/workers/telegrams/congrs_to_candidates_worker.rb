# frozen_string_literal: true

class Telegrams::CongrsToCandidatesWorker
  include Sidekiq::Worker
  def perform
    text = "🔥🔥🔥🔥 Chúc Mừng Bạn #{Generator::NameService.name} Đã Ứng Tuyển Thành Công Vị Trí ** #{Generator::JobTitleService.title} ** 🔥🔥🔥🔥"
    Telegram::PostCongratulationService.send_to_group(text, '-1001842175925')
  end
end
