class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  def customer_address_set
    self.postal_code + self.address
  end

  def customer_full_name
    self.last_name + self.first_name
  end

end
