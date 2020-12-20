class HomesController < ApplicationController
  def top
    @products = Product.all
    @categories = Category.all
  end

  def about
  end
end
