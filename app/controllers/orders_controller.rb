class OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = Address.all
    @new_address = Address.new
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
    @payment_method = params[:payment_method]
    if params[:address_from] == "0"
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @dear_name = current_customer.customer_full_name
    elsif params[:address_form] == "1"
    elsif params[:address_form] == "2"
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
