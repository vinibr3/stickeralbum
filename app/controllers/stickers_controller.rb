class StickersController < ApplicationController
	def index
		@stickers =
		Sticker.stickers_order_by_code(current_user.id)
			   .paginate(page: params[:page], per_page: 9)
	end
end