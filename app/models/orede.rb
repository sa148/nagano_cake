class Orede < ApplicationRecord
  belongs_to :customer
  has_many :order_details
end
