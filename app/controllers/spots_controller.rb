class SpotsController < ApplicationController
	respond_to :js
	def new
		@stickers=Sticker.stickers_order_by_code(current_user.id)
		@sticker_default_id = params[:sticker_default_id]
	end

	def create
		permitted = permitted_params
		sticker_default_exits = 
					StickerDefault.exists?(id: permitted[:sticker_default_id])
		sticker_exists = 
					Sticker.exists?(id: permitted_params[:sticker_id])

		if(sticker_default_exits && sticker_exists)
			@sticker = Sticker.find(permitted[:sticker_id])
			if(@sticker.sticker_default_id == permitted[:sticker_default_id].to_i)
				# Creats Spot (stichttp://localhost:3000/users/1/albums/2/spots/new?sticker_default_id=8k the Sticker)
				current_user.album.spots.create(permitted)
				# Remove Sticker from user collection
				@sticker.user_id = nil 
				@sticker.save
			else
				flash[:alert]=t('sticker_album.spot.alert.wrong_spot')
				redirect_to album_path and return
			end
		else
			flash[:alert]=t('sticker_album.spot.alert.error')
			redirect_to album_path and return
		end
		flash[:notice] = t('sticker_album.spot.notice.succesfull')
		redirect_to album_path album_path and return
	end

	private 
		def permitted_params
			params.require(:spot).permit(:sticker_default_id, :sticker_id)
		end
end