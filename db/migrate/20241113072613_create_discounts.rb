class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :item, null: true, foreign_key: true # Link to a specific item (nullable for group discounts)
      t.string :discount_type, null: false # 'individual' or 'group'
      t.decimal :discount_percentage, precision: 5, scale: 2, default: 0.00
      t.text :combo_item_names, default: "" # Store as a comma-separated string or JSON (Text type)
      t.timestamps
    end
  end
end
