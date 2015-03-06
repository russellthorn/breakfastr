class User < ActiveRecord::Base
  has_secure_password # references bcrypt gem
  has_many :pastries #association to belongs_to in pastry model
  has_many :orders #association to belongs_to in order model

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
