class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, precision: 9, scale: 2
      t.string :description
      t.belongs_to :category, index: true
      t.timestamps null: false
    end
  end
end
