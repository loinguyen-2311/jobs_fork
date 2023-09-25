namespace :migrate_hr_freelancer_email_confirmed do
  desc 'Migrate dtalent job id'
  task start: :environment do
    puts "##################### Start migrate_hr_freelancer_email_confirmed ########################"
    ActiveRecord::Base.connection.execute("UPDATE users SET email_confirmed = true WHERE user_type = '5'")
    puts "##################### End migrate_hr_freelancer_email_confirmed #####################"
  end
end
