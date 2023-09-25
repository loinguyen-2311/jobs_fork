class ChangeColumnToNewFromJobs < ActiveRecord::Migration[5.0]
  change_table :jobs do |table|
    change_column :jobs, :job_type, 'integer USING CAST(job_type AS integer)'
  end
end
