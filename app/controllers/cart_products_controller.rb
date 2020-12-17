class CartProductsController < ApplicationController
  def create
    product = Product.find(params[:id])
    cart_product = current_user.cart_products.new(product_id: product.id)
    cart_product.save
    redirect_to action: :index
  end

  def index
    @cart_products = current_customer.cart_products
    # @total_price = @cart_products.product.sum(:price)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id, :product_id, :amount)
  end
end
