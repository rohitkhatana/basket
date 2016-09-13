class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_and_belongs_to_many :tax_rates
end
