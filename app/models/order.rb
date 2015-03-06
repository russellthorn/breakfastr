class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :pastry

  validates :stripe_token, presence: true
end
