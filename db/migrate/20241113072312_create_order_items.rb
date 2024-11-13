class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price_at_order, precision: 10, scale: 2, null: false
      t.decimal :tax_amount, precision: 10, scale: 2, default: 0.00
      t.decimal :applied_discount_percentage, precision: 5, scale: 2, default: 0.00 # New column for applied discount
      t.timestamps
    end
  end
end
