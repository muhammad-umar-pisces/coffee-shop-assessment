# Clear existing records
Customer.delete_all
Order.delete_all
Item.delete_all
OrderItem.delete_all

# Create Customers (Users)
user1 = Customer.create!(
  name: 'John Doe',
  email: 'john.doe@example.com',
    phone_number: '+1321852124'
)

user2 = Customer.create!(
  name: 'Jane Smith',
  email: 'jane.smith@example.com',
  phone_number: '+132189763'
)

# Create Some Items
item1 = Item.create!(
  name: 'Coffee',
  description: 'Hot brewed coffee',
  price: 3.50,
  tax_rate: 0.10,
  is_free: false,
  discountable: true
)

item2 = Item.create!(
  name: 'Sandwich',
  description: 'Cheese sandwich',
  price: 5.00,
  tax_rate: 0.08,
  is_free: false,
  discountable: true
)

item3 = Item.create!(
  name: 'Mug',
  description: 'Coffee mug',
  price: 8.00,
  tax_rate: 0.15,
  is_free: false,
  discountable: false
)

# Create Orders for Customers
order1 = Order.create!(
  user_id: user1.id
)

order2 = Order.create!(
  user_id: user2.id
)

# Add Items to Orders
OrderItem.create!(order_id: order1.id, item_id: item1.id, quantity: 2, price_at_order: item1.price)
OrderItem.create!(order_id: order1.id, item_id: item2.id, quantity: 1, price_at_order: item2.price)

OrderItem.create!(order_id: order2.id, item_id: item1.id, quantity: 1, price_at_order: item1.price)
OrderItem.create!(order_id: order2.id, item_id: item3.id, quantity: 2, price_at_order: item3.price)

puts "Created #{User.count} users"
puts "Created #{Order.count} orders"
puts "Created #{Item.count} items"
puts "Created #{OrderItem.count} order items"
