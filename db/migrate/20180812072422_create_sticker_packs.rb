class CreateStickerPacks < ActiveRecord::Migration[5.2]
  def change
    create_table :sticker_packs do |t|
    	t.references :user
    	t.integer  :size,   null: false, default: 3
    	t.integer  :status, null: false, defaul: 0 # 0 = closed, 1=opened
    	t.datetime :opened_at
    end
  end
end
