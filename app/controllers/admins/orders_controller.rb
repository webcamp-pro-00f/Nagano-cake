class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @product_amount = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_product = @order.order_products
    #合計金額計算
    @product_price = 0
    @order_product.each do |order|
    @product_price += order.price * order.amount
    end
  end

  def update
    order = Order.find(params[:id])
    if order.status == "入金確認"
      order.order_products.each do |order_product|
        order_product.making_status = 1
        order_product.making_status.update(order_product_params)
      end
    elsif order.status == "発送済み"
      order.order_products.each do |order_product|
        order_product.making_status = "発送済み"
        order_product.making_status.update
      end
    end


    order.update(order_params)
    redirect_to admins_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end


end
