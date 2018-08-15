class AddTimestampToStickerPacks < ActiveRecord::Migration[5.2]
  def change
  	add_column :sticker_packs, :created_at, :datetime
  	add_column :sticker_packs, :update_at,  :datetime
  end
end
