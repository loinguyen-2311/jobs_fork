class AddJobTitleToEmailMarketings < ActiveRecord::Migration[5.0]
  def change
    add_column :email_marketings, :job_title, :string
  end
end
