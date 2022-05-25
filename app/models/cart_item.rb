class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price
    item.price * amount
  end
  def subtotal
    item.with_tax_price * amount
  end
end
