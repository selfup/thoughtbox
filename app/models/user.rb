class User < ActiveRecord::Base
  has_secure_password
  validates :email, email_format: { message: " is not in a valid format" }, uniqueness: true
end
