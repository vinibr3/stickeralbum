class ChangeEmailFromUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :email, :string, null: false, default: ""
  end
end
