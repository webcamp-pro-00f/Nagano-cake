class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer

  enument_method paym: {
    credit: 0,
    bank: 1
  }

end
