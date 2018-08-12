module SpotHelper
	def render_spot_image_helper spot
		if spot.sticked?
			image_tag spot.sticked_image,     size:"300x300",  alt:"Sticked Image #{spot.sticker_default.name}"
		else
			image_tag spot.not_sticked_image, size: "300x300", alt:"Not Sticked Image"
		end
	end
end