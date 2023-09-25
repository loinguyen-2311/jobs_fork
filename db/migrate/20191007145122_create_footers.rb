class CreateFooters < ActiveRecord::Migration[5.0]
  def change
    create_table :footers do |t|
      t.string :key
      t.string :value
      t.boolean :active

      t.timestamps
    end
  end
end
