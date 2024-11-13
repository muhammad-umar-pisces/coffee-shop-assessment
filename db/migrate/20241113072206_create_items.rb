class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :tax_rate, precision: 5, scale: 2, default: 0.00
      t.boolean :is_free, default: false
      t.boolean :discountable, default: true
      t.timestamps
    end
  end
end
