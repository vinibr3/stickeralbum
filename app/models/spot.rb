class Spot < ApplicationRecord 
	belongs_to :sticker,         validate: true, optional: true
	belongs_to :album,           validate: true, optional: false
	belongs_to :sticker_default, validate: true, optional: false

	def sticked?
		sticker.present?
	end

	def sticked_image
		"sticked-user.png"
	end

	def not_sticked_image
		"blank-user.png"
	end
end