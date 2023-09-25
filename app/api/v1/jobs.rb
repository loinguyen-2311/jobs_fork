class API::V1::Jobs < Grape::API
  helpers API::V1::Helpers
  resource :jobs do
    desc 'Dtalent Job Title',
         entity: API::Entities::V1::Job
    params do
      optional :title, type: String, desc: 'Job Title'
    end
    get 'dtalent_job_title' do
      present DtalentSyncJobService.new.job_title(params)
    end

    desc 'Dtalent Remote Job Title',
         entity: API::Entities::V1::Job
    params do
    end
    get 'dtalent_remote_job_title' do
      present DtalentSyncJobService.new.remote_job_title
    end

    desc 'Remote Jobs',
         entity: API::Entities::V1::Job
    params do
    end
    get 'remote_jobs' do
      jobs = []
      Job.dtalent_remote.map { |job| jobs.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://devfinding.com/single_job/#{job.id}") }
      present jobs
    end

    desc 'Dtalent Job commission',
         entity: API::Entities::V1::Job
    get 'dtalent_commission' do
      present DtalentSyncJobService.new.commission
    end

    desc 'Dtalent Job commission',
         entity: API::Entities::V1::Job
    get 'full_commission' do
      present DtalentSyncJobService.new.full_commission
    end

    desc 'full_commission_having_sync_job',
         entity: API::Entities::V1::Job
    get 'full_commission_having_sync_job' do
      present DtalentSyncJobService.new.full_commission_having_sync_job
    end

    desc 'sync job',
         entity: API::Entities::V1::Job
    get :sync_job do
      DtalentSyncJobService.new.sync_job
      present true
    end

    desc 'post_job_to_group_dev',
         entity: API::Entities::V1::Job
    get :post_job_dev_group do
      group_to_post = 'dev'
      Telegram::PostGroupService.call(group_to_post)
      present true
    end

    desc 'post_job_partners_group',
         entity: API::Entities::V1::Job
    get :post_job_partners_group do
      Telegram::PostGroupService.call('partners')
      present true
    end

    desc 'congrs_candidate',
         entity: API::Entities::V1::Job
    get :congrs_candidate do
      Telegram::PostCongratulationService.send_to_group(
        "🔥 Chúc Mừng Bạn #{Generator::NameService.name} Đã Ứng Tuyển Thành Công Vị Trí ** #{Generator::JobTitleService.title} ** 🔥",
        '-1001842175925'
      )

      Telegram::PostCongratulationService.send_to_group(
        "🔥🔥🔥🔥 Chúc Mừng Bạn #{Generator::NameService.name} Đã Nhận Được Hoa Hồng ** #{Generator::CommissionService.commission} ** 🔥🔥🔥🔥",
        '-1001716621158'
      )

      present true
    end

    desc 'post_to_fanpage',
         entity: API::Entities::V1::Job
    get :post_to_fanpage do
      FacebookService.new.post_to_fanpage
      present true
    end

    desc 'send_email_marketing_jobs',
         entity: API::Entities::V1::Job
    get :send_email_marketing_jobs do
      EmailMarketing.update_all(sent_email: false) if EmailMarketing.where(sent_email: false).count == 0
      job_by_keywords = Job.where(status: Job.statuses[:going], sync_from_partner: Job.sync_from_partners[:dtalent])
      email_marketings = EmailMarketing.where(sent_email: false).limit(20)
      begin
        JobMailer.send_to_email_marketing_email(job_by_keywords, email_marketings.pluck(:email)).deliver_now
      rescue StandardError => e
        Sentry.capture_exception(e)
      end
      email_marketings.update_all(sent_email: true)
      present true
    end

    desc 'marketing_job',
         entity: API::Entities::V1::Job
    get :marketing_job do
      present LuaGaJobService.call
    end

    desc 'post_marketing_job_to_group',
         entity: API::Entities::V1::Job
    get :post_marketing_job_to_group do
      Telegram::LuaGaJob::PostToDevGroupService.call
      present true
    end

    desc 'send email candidate'
    params do
    end
    get :send_email_candidate do
      CandidateMailer.notify_applied_job.deliver_now
      present true
    end

  end
end
