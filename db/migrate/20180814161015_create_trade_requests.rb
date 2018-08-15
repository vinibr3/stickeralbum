class CreateTradeRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_requests do |t|
    	t.integer  :offerer_id,  foreign_key: true, index: true
    	t.integer  :receiver_id, foreign_key: true, index: true
    	t.integer  :response,    null: false, default: 0
    	t.datetime :responsed_at
    	t.datetime :offered_at
    	t.timestamps
    end
  end
end
