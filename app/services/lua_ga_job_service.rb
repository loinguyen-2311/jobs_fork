class LuaGaJobService
  def self.call
    jobs = Job.lua_ga
    formated_job_title = []
    jobs.each do |job|
      formated_job_title.push("🔥 Đang tuyển 👉 #{job.title} (#{job.province}) - #{job.salary_text} 👉 https://#{ENV['DOMAIN']}/single_job/#{job.id}")
    end
    formated_job_title
  end
end
