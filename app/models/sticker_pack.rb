class StickerPack < ApplicationRecord
	has_many :stickers
	belongs_to :user, validate: true, optional: true
end