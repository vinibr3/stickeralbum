class TradeRequestsController < ApplicationController
	def index
		@user = current_user

		@trade_requests = @user.trade_requests
			.paginate(page: params[:page], per_page: 10)
						
		@trade_request_to_responses = 
			@user.trade_request_to_responses
				 .paginate(page: params[:page], per_page: 10)
	end

	def create
		@offerer = current_user
		username = permitted_params[:username]

		if(User.exists?(username: username))
			@receiver = 
				User.find_by_username(permitted_params[:username])
			    @trade_request = 
			    	@offerer.trade_request_offered
			    	        .build(receiver_id: @receiver.id)
			    if(username == @offerer.username)
			    	flash[:alert] = t('sticker_album.trade_request.yourself')
			    	redirect_to new_trade_path
			    end 

			    if(@trade_request.save!)
			    	flash[:notice] = 
			    		t('sticker_album.trade_request.successfull')
			    else
			    	flash[:alert] = t('sticker_album.trade_request.error')
			    end
		else
			flash[:alert] = 
				t('sticker_album.trade_request.error_username')
				+" Username: #{username}"
		end
		flash[:notice] = t('sticker_album.trade_request.successfull')
		redirect_to new_trade_path
	end

	def update
		@trade_request_id=permitted_params[:id]
		@trade_request=TradeRequest.find(@trade_request_id)
		@trade_request.response=permitted_params[:response].to_i
		@trade_request.save
		redirect_to new_trade_path
	end

	private
		def permitted_params
			params.permit(:id,:user_id,:username,:response)
		end
end