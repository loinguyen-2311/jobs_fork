class AddHotJobToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :hot_job, :boolean
  end
end
