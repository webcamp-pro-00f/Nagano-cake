class CartProductsController < ApplicationController
  # def create
  #   @cart_item = CartItem.new(item_params)
  #   @cart_item.user_id = current_user.id
  #   #税抜の小計価格を設定
  #   @cart_item.price = @cart_item.product.price * @cart_item.quantity
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.customer_id = current_customer.id
    cart_product.save
    redirect_to cart_products_path
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
