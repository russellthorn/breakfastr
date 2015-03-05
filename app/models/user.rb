class User < ActiveRecord::Base
  has_secure_password # references bcrypt gem
end
