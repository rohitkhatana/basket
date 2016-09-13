class ProductController < ApplicationController
  include CartHandler

  def index
    @products = Product.all
    @total = cart.rounded_total
  end
end
