namespace :migrate_slug_for_jobs do
  desc 'migrate_slug_for_jobs'
  task start: :environment do
    puts "################################## Start Migrate ####################################"
    Job.all.each do |job|
      job.update(slug: StringService.new.custom_normalize_string(job.title))
    end
    puts "################################## End Migrate ####################################"
  end
end
