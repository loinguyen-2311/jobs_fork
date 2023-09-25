# frozen_string_literal: true

class Telegrams::CongrsToPartnersWorker
  include Sidekiq::Worker
  def perform
    Telegram::PostCongratulationService.send_to_group(
      "🔥🔥🔥🔥 Chúc Mừng Bạn #{Generator::NameService.name} Đã Nhận Được Hoa Hồng ** #{Generator::CommissionService.commission} ** 🔥🔥🔥🔥",
      '-1001716621158'
    )
  end
end
