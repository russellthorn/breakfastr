class Pastry < ActiveRecord::Base
  belongs_to :user #association to pastries in user model
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :price_in_pence, numericality: { greater_than_or_equal_to: 50 }
end
