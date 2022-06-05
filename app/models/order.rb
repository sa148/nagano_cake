class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum order_status: { 未入金: 0, 入金済み: 1 }
  enum method_of_payment: { credit_card: 0, transfer: 1 }

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
