class TradeRequestMailer < ApplicationMailer
	def notify_receiver
		@trade_request=params[:trade_request]
		@receiver=@trade_request.receiver
		@offerer=@trade_request.offerer
		mail(to: @receiver.email, 
			 subject: 
			 t('sticker_album.trade_request.mailer.request_subject'))
	end

	def notify_offerer
		@trade_request = 
			TradeRequest.find(params[:trade_request_id])
		@receiver = @trade_request.receiver
		@offerer = @trade_request.offerer
		mail(to: @offerer.email, 
			subject: 
			t('sticker_album.trade_request.mailer.offerer_subject'))
	end
end