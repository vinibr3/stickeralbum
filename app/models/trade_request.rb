class TradeRequest < ApplicationRecord
	belongs_to :offerer,  class_name:'User', 
	                      foreign_key: 'offerer_id',
	                      inverse_of: :trade_request_offered
	belongs_to :receiver, class_name:'User', 
	                      foreign_key: 'receiver_id', 
	                      inverse_of: :trade_request_received
	enum response: [:not_responsed, :denied, :acepted]
end