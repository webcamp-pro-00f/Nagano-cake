class AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to '/addresses'
    else
      render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to '/addresses'
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to '/addresses'
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
