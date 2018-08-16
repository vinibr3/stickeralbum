module ApplicationHelper
	def render_application_modal_title
		if controller_name == "albums" && action_name == "show"
			render inline: "#{t('sticker_album.sticker.modal_title')}"
		end

		if controller_name == "users" && action_name == "index"
			render inline: "#{t('sticker_album.new_trade.modal_title')}"
		end
	end

	def render_application_modal_footer_content_form
		if controller_name == "albums" && action_name == "show"
        	render "spots/form"
		end

		if controller_name == "users" && action_name == "index"
			"<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>".html_safe
		end
	end
end
