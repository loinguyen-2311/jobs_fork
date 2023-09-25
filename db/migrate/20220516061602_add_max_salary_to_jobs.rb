class AddMaxSalaryToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :max_salary, :integer
  end
end
