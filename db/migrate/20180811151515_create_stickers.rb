class CreateStickers < ActiveRecord::Migration[5.2]
  def change
    create_table :stickers do |t|
    	t.references :user,            foreign_key: true
    	t.references :sticker_default, foreign_key: true
    	t.references :sticker_pack,    foreign_key: true
    	t.references :spot,            foreign_key: true
    end
  end
end
