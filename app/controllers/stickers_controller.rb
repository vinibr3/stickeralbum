class StickersController < ApplicationController
	def index
		@stickers =
		Sticker.stickers_order_by_code(current_user.id)
			   .paginate(page: params[:page], per_page: 9)
	end

	def search
		@user = User.find_by_username(permitted_params[:username])
		@stickers = @user.stickers
		respond_to do |format|
			format.js
		end
	end

	private
		def permitted_params
			params.permit(:user_id,:username)
		end
end