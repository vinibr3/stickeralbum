class TradeRequest < ApplicationRecord
	belongs_to :offerer,  class_name:'User', 
	                      foreign_key: 'offerer_id',
	                      inverse_of: :trade_request_offered
	belongs_to :receiver, class_name:'User', 
	                      foreign_key: 'receiver_id', 
	                      inverse_of: :trade_request_received
	enum response: [:not_responsed, :denied, :acepted]

	after_create :send_trade_request_mailer_to_receiver

	def send_trade_request_mailer_to_receiver
		TradeRequestMailer.with(trade_request: self).notify_receiver.deliver_later
	end
end