class StickersController < ApplicationController
	def index
		@stickers=Sticker.where(user_id: current_user.id)
						 .includes(:sticker_default)
						 .order('sticker_defaults.code')
						 .paginate(page: params[:page], per_page: 9)
	end
end