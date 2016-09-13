class CartController < ApplicationController
  include CartHandler

  def clear
    cart.clear
    clear_session_cart
    redirect_to root_path
  end

  def add
    cart.add_item(item)
    update_session_cart
    redirect_to root_path
  end

end
