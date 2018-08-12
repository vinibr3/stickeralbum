class CreateStickerDefaults < ActiveRecord::Migration[5.2]
  def change
    create_table :sticker_defaults do |t|
    	t.string :code, null: false, index: true, limit: 255, unique: true
    	t.string :name, null: false, index: true, limit: 255, unique: true
    	t.timestamps
    end
  end
end
