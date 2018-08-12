class Sticker < ApplicationRecord
	belongs_to :user,            validate: true, optional: true
	belongs_to :sticker_default, validate: true, optional: false
	belongs_to :sticker_pack,    validate: true, optional: true
	belongs_to :spot,            validate: true, optional: true
end