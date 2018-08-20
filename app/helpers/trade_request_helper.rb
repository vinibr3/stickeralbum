module TradeRequestHelper 
	def render_trade_history_response_type trade_request
		if trade_request.not_responsed?
			classify = "active"
		elsif trade_request.denied?
			classify = "danger"
		else trade_request.acepted?
			classify = "success"
		end
		classify
	end
end