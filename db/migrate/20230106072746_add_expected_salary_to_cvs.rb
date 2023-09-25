class AddExpectedSalaryToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :expected_salary, :text
    add_column :cvs, :onboarding_time, :datetime
  end
end
