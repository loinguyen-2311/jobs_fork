class AddSentEmailToEmailMarketings < ActiveRecord::Migration[5.0]
  def change
    add_column :email_marketings, :sent_email, :boolean, default: false
  end
end
