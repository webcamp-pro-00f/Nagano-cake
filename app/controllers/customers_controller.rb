class CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to action: :show
  end

  def out
  end

  def hide
    customer = current_customer
    customer.update(is_deleted:true)
    customer_cart = customer.cart_products.find_by(customer_id: current_customer.id)
    customer_cart.delete
    reset_session #ユーザーをログアウト
    redirect_to root_path #ログアウト後にtop画面へ遷移
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number)
  end

end
