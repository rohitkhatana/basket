class Item
  include ActiveModel::Validations

  attr_accessor :price, :description, :quantity, :location

  validates_numericality_of :quantity, :only_integer => true
  validates_numericality_of :price

end
