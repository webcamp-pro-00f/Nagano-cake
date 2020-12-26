class Address < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :customer_id, presence: true

  def address_set
    self.postal_code + self.address + self.name
  end

end
