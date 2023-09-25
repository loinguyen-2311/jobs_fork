class AddLastSinceNumberToGithubs < ActiveRecord::Migration[5.0]
  def change
    add_column :github_email_marketings, :last_since_number, :integer, default: 0
  end
end
