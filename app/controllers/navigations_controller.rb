class NavigationsController < ApplicationController
	def album
		if user_signed_in?
			redirect_to current_user
		else
			redirect_to new_user_session_path
		end
	end

	def exit
		redirect_to destroy_user_session_path
	end
end