class StickerPacksController < ApplicationController
	def index
		@sticker_packs=current_user
			.sticker_packs
			.closed
		    .paginate(page: params[:page], per_page: 6)   
	end
end