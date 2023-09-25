class AddMinSalaryToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :min_salary, :integer
  end
end
