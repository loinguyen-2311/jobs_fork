class AddSyncFromPartnerToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :sync_from_partner, :integer, :default => 0
  end
end
