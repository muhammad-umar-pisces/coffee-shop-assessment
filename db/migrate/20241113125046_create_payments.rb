class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order, foreign_key: true, null: false
      t.decimal :amount_paid, precision: 10, scale: 2, null: false
      t.string :payment_method, null: false # e.g., 'cash', 'card', 'online'
      t.string :payment_status, default: 'pending' # e.g., 'pending', 'completed', 'failed'
      t.datetime :payment_date, null: false
      t.timestamps
    end
  end
end
