class AddStatusToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :status, :integer
  end
end
