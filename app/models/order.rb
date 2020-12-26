class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer

  enum payment_method: {

  credit: 0,
  bank: 1
  }

  def payment_method_text
    if self.payment_method == "credit"
      "クレジットカード"
    elsif self.payment_method == "bank"
      "銀行振込"
    end
  end

  enum status: {
  "入金待ち": 0,
  "入金確認": 1,
  "製作中": 2,
  "発送準備中": 3,
  "発送済み": 4,
  }

  def address_set
    self.postal_code + self.address
  end
end
