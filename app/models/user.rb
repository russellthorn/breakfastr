class User < ActiveRecord::Base
  has_secure_password # references bcrypt gem
  has_many :pastries #association to belongs_to in pastry model
  has_many :orders #association to belongs_to in order model
end
