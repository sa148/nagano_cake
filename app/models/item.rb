class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details
  enum item_status: { 販売: 0, 在庫: 1 }
   def get_image
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [100, 100]).processed
   end
   def with_tax_price
    (price * 1.1).floor
   end
end
