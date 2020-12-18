class CartProductsController < ApplicationController
  before_action :setup_cart_item!, only: [:create]
  # def create
  #   @cart_item = CartItem.new(item_params)
  #   @cart_item.user_id = current_user.id
  #   #税抜の小計価格を設定
  #   @cart_item.price = @cart_item.product.price * @cart_item.quantity
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end
  
  
  # def add_item
  #   if @cart_item.blank?
  #     @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
  #   end

  #   @cart_item.quantity += params[:quantity].to_i
  #   @cart_item.save
  #   redirect_to current_cart
  # end
  # private

  # def setup_cart_item!
  #   @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  # end
  
  

  def create
    if @cart_product.blank?
      @cart_product = current_cart.cart_products.build(product_id: params[:product_id])
    end
    @cart_product.amount += params[:amount].to_i
    @cart_product.save
    redirect_to cart_products_path
    # redirect_to current_cart
  end

  def index
    @cart_products = current_cart.cart_products
    
    # @total_price = @cart_products.product.sum(:price)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def setup_cart_item!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end
end
