class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,    limit: 100, unique: true, index: true
      t.string :username, limit: 20,  unique: true, index: true
      t.string :password_digest
    end
  end
end
