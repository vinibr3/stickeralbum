class User < ApplicationRecord
	has_secure_password
	before_save {email.downcase!}
	validates :email, presence: true, length: { maximum: 100 }, 
					  format:{with: VALID_EMAIL_REGEX}, 
					  uniqueness: {case_sensitive: false}
	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: true
	validates :password, presence: true, length:{minimum: 6}, 
	                     allow_blank: false
end