class CreateCvs < ActiveRecord::Migration[5.0]
  def change
    create_table :cvs do |t|
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
