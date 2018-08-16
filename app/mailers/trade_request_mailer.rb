class TradeRequestMailer < ApplicationMailer
	layout "trade_requests"
	def notify_receiver
		@trade_request=params[:trade_request]
		@receiver=@trade_request.receiver
		@offerer=@trade_request.offerer
		mail(to: @receiver.email, subject: t('sticker_album.trade_request.mailer.subject'))
	end
end