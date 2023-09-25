class AddCommissionToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :commission, :string
  end
end
