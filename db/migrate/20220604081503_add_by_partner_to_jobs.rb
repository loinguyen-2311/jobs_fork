class AddByPartnerToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :by_partner, :string
  end
end
