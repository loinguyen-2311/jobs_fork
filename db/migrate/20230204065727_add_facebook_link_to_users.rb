class AddFacebookLinkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_link, :string
  end
end
