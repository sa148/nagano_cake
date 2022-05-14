class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  enum item_status: { 新品: 0, 在庫: 1 }
end
