class Admins::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to  admins_product_path(product)
  end

  def index
    @products = Product.all
  end

  def show
    @tax = 0.08
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to  admins_product_path(product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :image, :category_id, :price, :is_active)
  end

end
