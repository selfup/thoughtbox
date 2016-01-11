class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates :email_address, presence: true, uniqueness: true
end
