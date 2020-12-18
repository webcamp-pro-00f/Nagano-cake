class Admins::OrdersController < ApplicationController
  def index
  end

  def show
    @customer = Customer.find(customer_params)
  end

  def update
  end
end

