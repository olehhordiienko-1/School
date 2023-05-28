class CreatePriceLists < ActiveRecord::Migration[7.0]
  def change
    create_table :price_lists do |t|
      t.string :payment_type
      t.decimal :tuition_cost
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
