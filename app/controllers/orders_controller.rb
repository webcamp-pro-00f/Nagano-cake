class OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = Address.all
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @cart_products = current_customer.cart_products

    if params[:order][:address_form] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.customer_full_name
    elsif params[:order][:address_form] == "1"
      @address_id = params[:order][:order_address].to_i
      @address = Address.find_by(id: @address_id)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_form] == "2"
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def finish
  end

  private
  def order_params
    params.require(:order).permit(:name, :postal_code,:address,:charge,:payment_method,:statusname, :postal_code, :address)
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
