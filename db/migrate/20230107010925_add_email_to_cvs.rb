class AddEmailToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :email, :string
  end
end
