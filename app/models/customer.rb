class Customer < ApplicationRecord
  enum response_status: { member: 0, secession: 1 }
  def active_for_authentication?
    super && (is_deleted == false)
  end
  has_many :delivers
  has_many :cart_items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
