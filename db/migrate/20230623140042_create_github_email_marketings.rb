class CreateGithubEmailMarketings < ActiveRecord::Migration[5.0]
  def change
    create_table :github_email_marketings do |t|
      t.string :email
      t.string :job_title
      t.string :username

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
