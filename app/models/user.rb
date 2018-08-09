class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable
	
	before_save {email.downcase!}
	validates :email, presence: true, length: { maximum: 100 }, 
					  format:{with: VALID_EMAIL_REGEX}, 
					  uniqueness: {case_sensitive: false}
	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: true
	
end