class AddSearchTsvectorToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :search_tsvector, :tsvector
    add_index(:jobs, :search_tsvector, using: 'gin')
  end
end
