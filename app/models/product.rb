class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy
  attachment :image
end
