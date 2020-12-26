class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    @categories = Category.all
    @tax = TAX
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products.page(params[:page])
    end
  end


  def show
    @tax = TAX
    @categories = Category.all
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

end
