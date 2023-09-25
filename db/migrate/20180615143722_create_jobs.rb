class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      # Text Type
      t.text :benifit
      t.text :requirement
      t.text :description

      # String Type
      t.string :city
      t.string :title
      t.string :category
      t.string :province
      t.string :job_type
      t.string :job_system, :null => false, :default => 'viecgiasu'
      t.string :salary_type
      t.string :company_name

      # Integer Type
      t.integer :salary
      t.integer :views, :null => false, :default => 0

      # Boolean Type
      t.boolean :display_pulse, :null => false, :default => false

      t.timestamps
    end
  end
end
