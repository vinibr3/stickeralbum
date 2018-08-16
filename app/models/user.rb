class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable
	
	before_save {email.downcase!}
	validates :email, presence: true, length: { maximum: 100 }, 
					  format:{with: VALID_EMAIL_REGEX}, 
					  uniqueness: {case_sensitive: false}
	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: true

	has_one :album, :dependent => :destroy
	has_many :stickers
	has_many :sticker_packs
	has_many :trade_request_offered,  class_name: 'TradeRequest', 
	                                  foreign_key:'offerer_id',
	                                  inverse_of: :offerer
	has_many :trade_request_received, class_name: 'TradeRequest', 
	                                  foreign_key:'receiver_id',
	                                  inverse_of: :receiver

	after_create :create_album, :creates_stickers_collection_to_user 

	# Creates predefined stickers 'quantity' to user, default is 15
	# 'quantity' can be retrieved from an 'Configuration Table' in database
	# Orders StickerDefaults ids within an array and chose randonly one. 
	# And repeats for 'quantity' times to create new stickers to user
	def creates_stickers_collection_to_user quantity=15
		sticker_default_ids = StickerDefault.pluck(:id)
		quantity.times do 
			position_selected_sticker_default_ids = 
							rand(0..sticker_default_ids.size-1)
			stickers.create({sticker_default_id: 
				sticker_default_ids[position_selected_sticker_default_ids]})
		end
	end

	def image
		"perfil.png"
	end
end