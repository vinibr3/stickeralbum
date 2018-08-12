class Album < ApplicationRecord
	has_many :spots
	belongs_to :user, validate: true, optional: false
end