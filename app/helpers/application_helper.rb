module ApplicationHelper
	def render_application_modal_title
		if controller_name == "albums" && action_name == "show"
			render inline: "#{t('sticker_album.sticker.modal_title')}"
		end
	end

	def render_application_modal_footer_content_form
		if controller_name == "albums" && action_name == "show"
        	render "spots/form"
		end
	end
end
