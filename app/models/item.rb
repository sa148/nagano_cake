class Item < ApplicationRecord
  enum item_status: { 新品: 0, 在庫: 1 }
end
