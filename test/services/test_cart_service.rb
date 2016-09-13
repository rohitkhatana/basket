require "minitest/autorun"
require 'test_helper'
class CartTest < ActiveSupport::TestCase
  cart = Cart.new([{price: 200, quantity: 2, location: 'CA', description: 'cloth'}])

  test "cart total without round" do
    assert_equal cart.total, 438.8
  end

  test "cart total with round" do
    assert_equal cart.rounded_total, 438.8
  end
end
