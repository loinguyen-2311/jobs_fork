class AddBonusForDevToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :bonus_for_dev, :integer
  end
end
