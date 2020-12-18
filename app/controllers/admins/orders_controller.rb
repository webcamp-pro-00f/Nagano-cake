class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
  end
end

