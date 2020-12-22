class ProductsController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
    @tax = TAX
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products
    end
  end


  def show
    @tax = TAX
    @categories = Category.all
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

end
