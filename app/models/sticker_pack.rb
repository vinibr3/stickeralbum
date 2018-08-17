class StickerPack < ApplicationRecord
	has_many :stickers
	belongs_to :user, validate: true, optional: true
	enum status: [:closed, :opened]
	before_create {self.size=3}

	def image
		"sticker-pack-default.png"
	end
end