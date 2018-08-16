class ApplicationMailer < ActionMailer::Base
  default from: ENV['STICKER_ALBUM_MAILER_SENDER']
  layout 'mailer'
end
