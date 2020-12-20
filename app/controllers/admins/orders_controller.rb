class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
<<<<<<< HEAD
    @customer = Customer.find(customer_params)
=======
    @order = Order.find(params[:id])
    @order_product = @order.order_products
    @status = order.status.all
    @making_status = order.order_product.making_status.all
>>>>>>> origin/views
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
