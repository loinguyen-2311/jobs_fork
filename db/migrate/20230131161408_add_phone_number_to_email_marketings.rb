class AddPhoneNumberToEmailMarketings < ActiveRecord::Migration[5.0]
  def change
    add_column :email_marketings, :phone_number, :string
  end
end
