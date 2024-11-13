# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create some sample items
items = [
  { name: 'Coffee', description: 'A hot cup of coffee', price: 5.00, tax_rate: 8.25, is_free: false, discountable: true },
  { name: 'Sandwich', description: 'A delicious sandwich', price: 7.50, tax_rate: 5.00, is_free: false, discountable: true },
  { name: 'Mug', description: 'A coffee mug', price: 10.00, tax_rate: 0.00, is_free: false, discountable: true },
  { name: 'Croissant', description: 'A fresh croissant', price: 3.50, tax_rate: 5.00, is_free: false, discountable: true },
  { name: 'Free Drink', description: 'A free drink with a combo', price: 0.00, tax_rate: 0.00, is_free: true, discountable: false }
]

# Create items in the database
items.each do |item_data|
  Item.create!(item_data)
end
