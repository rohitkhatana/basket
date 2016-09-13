module CartHandler
  extend ActiveSupport::Concern

  def cart
    @cart || @cart=parse_cart
  end

  def parse_cart
    if session[:cart]
      Cart.new(JSON.parse(session[:cart], {symbolize_names: true})[:items])
    else
      Cart.new([])
    end
  end

  def item_params
    params.permit(:state, :quantity, :product_id)
  end

  def item
    product = Product.where(id: item_params[:product_id]).first
    item = {}
    item[:price] = product.price.to_f
    item[:product_id] = product.id
    item[:quantity] = item_params[:quantity].to_i
    item[:state] = item_params[:state]
    item
  end
end
