class CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.customer_id = current_customer.id
    customer_cart = CartProduct.where(customer_id: current_customer.id)
    already_cart = customer_cart.find_by(product_id: params[:cart_product][:product_id])
    if already_cart
      already_cart.amount += params[:cart_product][:amount].to_i
      already_cart.save
    else
      cart_product.save
    end
    redirect_to cart_products_path
  end

  def index
    @tax = TAX
    @cart_products = current_customer.cart_products
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    cart_products = current_customer.cart_products
    cart_products.destroy_all
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :amount)
  end
end
