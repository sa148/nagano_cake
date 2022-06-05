class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { 制作中: 0, 製作完了: 1 }
end
