class AlbumsController < ApplicationController
	def show
		@user = current_user
		@album = @user.album
		@spots = Array.new
		
		# Get [id, name ,code] from StickerDefault 
		sticker_defaults = StickerDefault.order(:code).pluck(:id, :name, :code)
		# Map Sticker Defaults to Spots
		spot_defaults = map_sticker_defaults_to_spot @album.id, sticker_defaults

		# sticker_default_ids and sticker_id from sticked spots
		spot_stickeds = @album.spots.pluck(:sticker_default_id, :sticker_id)

		spot_stickeds.each do |spot_sticked| 
			# Search StickerDefault which match Spot sticked
			spot_defaults.each do |spot_default|
				if(spot_sticked[0].to_i == spot_default[:sticker_default_id].to_i)
					# Set spot sticker_id, it's mean spot is sticked
					spot_default[:sticker_id] = spot_sticked[1]
				end
				# @spots << Spot.new(spot_default)
			end
		end
		# Spot Initialize overrided 
		@spots = Spot.build_spots(spot_defaults)
		# logger.debug "#{@spots.inspect}"
	end

	private 
		def map_sticker_defaults_to_spot album_id, sticker_defaults
			sticker_defaults.map{|v| {album_id: @album.id, 
									  sticker_id: nil, 
									  sticker_default_id: v[0], 
									  name:v[1], 
									  code:v[2]}}
		end
end