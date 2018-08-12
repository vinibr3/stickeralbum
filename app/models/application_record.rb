class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_ALPHA_REGEX = /\A[a-z A-Z]+\z/
  VALID_NUMERIC_REGEX = /\A[0-9]+\z/
end
