class CartController < ApplicationController
  include CartHandler

  def generate
    render json: cart.rounded_total
  end

  def add
    cart.add_item(item)
    session[:cart] = cart.to_json
    redirect_to root_path
  end

end
