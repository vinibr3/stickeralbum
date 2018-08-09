class ChangeEncryptedPasswordFromUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :encrypted_password, :string, null: false, default: ""
  end
end
