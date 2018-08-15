module StickerPackHelper
	def render_sticker_pack_image sticker_pack
		image_tag sticker_pack.image, size:"300x300", 
		                              class: "img img-responsive", 
		                              alt: "Sticker Pack Created At #{sticker_pack.created_at}"
	end
end