class AddBonusToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :bonus, :integer
  end
end
