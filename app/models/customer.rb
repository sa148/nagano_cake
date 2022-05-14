class Customer < ApplicationRecord
  def active_for_authentication?
    super && (is_valid == true)
  end
  has_many :addresses
  has_many :cart_items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
