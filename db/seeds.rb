# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.destroy_all
Product.destroy_all
TaxRate.destroy_all
food_category = Category.create(name: "food")
cloth_category = Category.create(name: "cloth")

TaxRate.create(rate: 9.75, exempted_categories: [food_category], state: "CA")
TaxRate.create(rate: 7.00, exempted_categories: [cloth_category, food_category],
state: "NJ")

10.times do |i|
  Product.create(category: food_category, description: "food#{i+1}", price: 12*(i+1))
end
