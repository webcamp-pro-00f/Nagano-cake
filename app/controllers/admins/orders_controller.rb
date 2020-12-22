class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @product_amount = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    #合計金額計算
    @product_price = 0
    @order_products.each do |order_product|
      @product_price += order_product.price * order_product.amount
    end
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "入金確認"
      order.order_products.each do |order_product|
        order_product.making_status = "製作待ち"
        order_product.save
      end
    end
    redirect_to admins_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_product_params
    params.require(:order_product).permit(:making_status)
  end
end
