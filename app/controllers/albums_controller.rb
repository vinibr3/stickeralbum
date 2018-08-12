class AlbumsController < ApplicationController
	def show
		@user = current_user
		@album = @user.album
		array_spots = Array.new
		sticker_default_ids = StickerDefault.order(:code).pluck(:id)
		array_spots = 
		sticker_default_ids.map{|sticker_default_id| 
			                {sticker_default_id: sticker_default_id}}
		@spots = @album.spots.build(array_spots)

		@sticked_spots = @album.spots.pluck(:id)
		
	end
end