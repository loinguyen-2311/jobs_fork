class AddSentJobToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :sent_job, :boolean, default: false
  end
end
