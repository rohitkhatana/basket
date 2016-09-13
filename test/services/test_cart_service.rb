require "minitest/autorun"
require 'test_helper'
class CartTest < ActiveSupport::TestCase

  test "should empty cart" do
    cart = Cart.new([{price: 200, quantity: 2, state: 'CA',
       description: 'cloth', category_id: 2}])
    cart.clear
    assert_equal cart.items, []
  end

  test "empty cart should have total 0" do
    empty_cart = Cart.new []
    assert_equal empty_cart.total, 0
  end

  test "tax should not be applicable on food in California" do
    cart = Cart.new([{price:200, quantity: 2, state: 'CA',
       description: 'cloth', category_id: 1}])
    assert_equal cart.rounded_total, 400
  end

  test "tax should not be applicable on food in New Jersey" do
    cart = Cart.new([{price:200, quantity: 2, state: 'NJ',
       description: 'cloth', category_id: 1}])
    assert_equal cart.rounded_total, 400
  end

  test "tax should not be applicable on cloth in New Jersey" do
    cart = Cart.new([{price:200, quantity: 2, state: 'NJ',
       description: 'cloth', category_id: 2}])
    assert_equal cart.rounded_total, 400
  end

  test "cart total with round should give rounded (nearest 0.05) amount" do
    cart = Cart.new([{price: 14, quantity: 2, state: 'CA',
       description: 'cloth', category_id: 2}])
    assert_equal cart.rounded_total, 30.75
  end

  test "cart total without round should give actual amount" do
    cart = Cart.new([{price: 14, quantity: 2, state: 'CA',
       description: 'cloth', category_id: 2}])
    assert_equal cart.total.to_f, 30.73
  end

end
