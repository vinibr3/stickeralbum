module SpotHelper
	def render_spot_image_helper spot
		if spot.sticked?
			image_tag spot.sticked_image,     class:"img img-responsive", alt:"Sticked Image #{spot.sticker_default.name}"
		else
			image_tag spot.not_sticked_image, class:"img img-responsive", alt:"Not Sticked Image"
		end
	end
end