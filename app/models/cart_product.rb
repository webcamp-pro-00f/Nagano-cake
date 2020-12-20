class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def subtotal
    self.amount * self.product.price
  end
end
