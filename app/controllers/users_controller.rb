class UsersController < ApplicationController
	def index
		@users = User.where.not(id: current_user.id)
		             .paginate(page: params[:page], per_page: 13)
	end

	def show
		@user_to_show_stickers = 
		User.find(permitted_params[:username])
	end

	private
		def permitted_params
			params.permit(:usernane)
		end

end