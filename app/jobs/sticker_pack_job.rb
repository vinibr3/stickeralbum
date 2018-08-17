class StickerPackJob < ApplicationJob
	queue_as :default

	def perform(*args)
		User.find_each do |user|
		 	date = last_date user
			quantity_sticker_packs_late = 
				(Time.new - date).to_i/3.hour.seconds
			# Create the late StickerPacks
			quantity_sticker_packs_late.to_i.times do
				user.sticker_packs.create(status: 0)
			end
		end	
		StickerPackJob.set(wait: 1.minute).perform_later
	end

	private 
		def last_date user
			last_sticker_pack = user.sticker_packs.order(:created_at).last
			last_sticker_pack ? last_sticker_pack.created_at : user.created_at
		end
end