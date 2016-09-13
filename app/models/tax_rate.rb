class TaxRate < ActiveRecord::Base
  has_and_belongs_to_many :exempted_categories, class_name: "Category"
end
