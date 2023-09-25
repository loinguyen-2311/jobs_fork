class AddCreateByIdToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :created_by_id, :integer
  end
end
