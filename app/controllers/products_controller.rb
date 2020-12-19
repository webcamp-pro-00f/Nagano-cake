class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products
    end
  end
  

  def show
    @categories = Category.all
    @product = Product.find(params[:id])
  end
  
end
