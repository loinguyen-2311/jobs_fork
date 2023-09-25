class AddFromLeaderToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :from_leader, :string
  end
end
