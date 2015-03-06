class Pastry < ActiveRecord::Base
  belongs_to :user #association to pastries in user model
  has_many :orders
end
