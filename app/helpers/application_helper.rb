module ApplicationHelper
	def application_modal_title_helper
		case controller_name
		when "albums"
			render inline: t('sticker_album.sticker.modal_title')
		when "users"
			render inline: t('sticker_album.new_trade.modal_title')
		when "sticker_packs"
			render inline: t('sticker_album.sticker_pack.modal.title')
		else
		end
	end

	def render_application_modal_footer_content_form
		case controller_name
		when "albums"
			render "spots/form"
		else
			dismiss_modal_button
		end
	end

	def dismiss_modal_button
		"<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>".html_safe
	end

	def wellcome_helper
		render inline: t('sticker_album.navigation.wellcome')+", #{current_user.username}" if user_signed_in?
	end

	def exit_helper
		link_to "Exit", destroy_user_session_path, method: :delete if user_signed_in?
	end

	def flash_class(level)
    	case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    	end
	end

	def link_active_helper content, path
		class_name=""
		case controller_name
		when "albums"
			class_name="navigation-active" if t('sticker_album.navigation.album') == content
		when "stickers" 
			class_name="navigation-active" if t('sticker_album.navigation.stickers') == content
		when "sticker_packs" 
			class_name="navigation-active" if t('sticker_album.navigation.packs') == content
		when "users" 
			class_name="navigation-active" if t('sticker_album.navigation.new_trades') == content
		when "trade_requests" 
			class_name="navigation-active" if t('sticker_album.navigation.trade_history') == content
		else
			
		end
		logger.debug "CONTROLLER #{controller_name}"
		logger.debug "CLASS NAME #{class_name}"
		logger.debug "TESTE #{t('sticker_album.navigation.album') == content}"
		link_to content, path, :class=>"#{class_name}"	
	end
end
