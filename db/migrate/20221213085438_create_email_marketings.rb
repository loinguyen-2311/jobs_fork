class CreateEmailMarketings < ActiveRecord::Migration[5.0]
  def change
    create_table :email_marketings do |t|
      t.string :email

      t.timestamps
    end
  end
end
