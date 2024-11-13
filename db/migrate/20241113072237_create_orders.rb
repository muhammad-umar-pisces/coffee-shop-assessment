class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.integer :status, default: 0 # Enum for order status (e.g., 0: placed, 1: completed, 2: cancelled)
      t.datetime :completed_at
      t.timestamps
    end
  end
end