class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @product_amount = 0
  end

  def show
    @tax = TAX
    @order = Order.find(params[:id])
    @order_product = @order.order_products
    #合計金額計算
    @product_price = 0
    @order_product.each do |order|
    @product_price += (order.price * @tax).floor * order.amount
    end

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admins_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end


end
