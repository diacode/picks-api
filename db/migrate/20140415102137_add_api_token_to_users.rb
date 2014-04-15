class AddApiTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :api_token, :string, unique: true
  end
end
