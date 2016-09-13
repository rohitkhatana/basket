class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.string :state
      t.decimal :rate, precision: 5, scale: 2
      t.timestamps null: false
    end

    create_join_table :categories, :tax_rates do |t|
      t.index :category_id
      t.index :tax_rate_id
    end
  end
end
