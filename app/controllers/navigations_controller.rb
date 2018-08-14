class NavigationsController < ApplicationController
	def album
		if user_signed_in?
			redirect_to user_album_path(current_user, current_user.album)
		else
			redirect_to new_user_session_path
		end
	end

	def exit
		redirect_to destroy_user_session_path
	end

	def stickers
		redirect_to user_stickers_path current_user
	end
end