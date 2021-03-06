class StickerPacksController < ApplicationController
	def index
		@sticker_packs=current_user
			.sticker_packs
			.closed
		    .paginate(page: params[:page], per_page: 8)   
	end

	def update
		@sticker_pack_id = permitted_params[:id]
		@sticker_pack = StickerPack.find(@sticker_pack_id)
		ids_defaults = 
			StickerDefault.find_ids_rand(@sticker_pack.size)
						  .map{|v| {sticker_default_id: v}}
		@stickers=current_user.stickers.create(ids_defaults)
		@sticker_pack.opened!
	end

	private
		def permitted_params
			params.permit(:id)
		end
end