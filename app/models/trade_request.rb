class TradeRequest < ApplicationRecord
	belongs_to :offerer,  class_name:'User', 
	                      foreign_key: 'offerer_id',
	                      inverse_of: :trade_request_offered
	belongs_to :receiver, class_name:'User', 
	                      foreign_key: 'receiver_id', 
	                      inverse_of: :trade_request_received
	enum response: [:not_responsed, :denied, :acepted]

	after_create :send_trade_request_mailer_to_receiver
	after_update :send_trade_request_mailer_to_offerer

	before_update :set_responsed_at

	def send_trade_request_mailer_to_receiver
		TradeRequestMailer.with(trade_request: self)
						  .notify_receiver.deliver_later
	end

	def send_trade_request_mailer_to_offerer
		TradeRequestMailer.with(trade_request_id: self.id)
			.notify_offerer.deliver_later if request_responsed?
								
	end

	def set_responsed_at
		self.responsed_at = Time.now unless request_responsed?
	end

	private
		def request_responsed?
			!self.not_responsed? && self.responsed_at.present?
		end
end