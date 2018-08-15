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

	def packs
		redirect_to user_sticker_packs_path current_user
	end

	def trade
		redirect_to user_trade_requests_path current_user
	end
end