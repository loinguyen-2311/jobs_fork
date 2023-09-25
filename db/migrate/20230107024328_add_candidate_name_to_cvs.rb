class AddCandidateNameToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :candidate_name, :string
  end
end
