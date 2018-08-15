class TradeRequestsController < ApplicationController
	def index
		@user = current_user
		@trade_requests=TradeRequest.where(offerer_id: @user.id)
									.includes(:offerer, :receiver)
									.order(:created_at)
									.paginate(page: params[:page], per_page: 10)
	end
end