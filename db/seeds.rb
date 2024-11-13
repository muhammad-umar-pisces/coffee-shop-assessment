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

# db/seeds.rb

# Create sample items
beverage = Item.find_or_create_by(name: 'Beverage', price: 5.00)
sandwich = Item.find_or_create_by(name: 'Sandwich', price: 6.00)
mug = Item.find_or_create_by(name: 'Coffee Mug', price: 3.00)
pastry = Item.find_or_create_by(name: 'Pastry', price: 2.50)

# Create Individual Discounts
Discount.find_or_create_by(
  item: beverage,
  discount_type: 'individual',
  discount_percentage: 10.00 # 10% off on beverage
)

Discount.find_or_create_by(
  item: sandwich,
  discount_type: 'individual',
  discount_percentage: 15.00 # 15% off on sandwich
)

# Create Group Discounts (Combo Offers)
Discount.find_or_create_by(
  item: beverage, # No specific item linked, group discount
  discount_type: 'group',
  discount_percentage: 20.00, # 20% off on combo of Beverage + Sandwich
  combo_item_names: [beverage.id, sandwich.id].join(',')
)

Discount.find_or_create_by(
  item: nil, # No specific item linked, group discount
  discount_type: 'group',
  discount_percentage: 30.00, # 30% off on combo of Pastry + Beverage
  combo_item_names: [pastry.id, beverage.id].join(',')
)

# Another Group Discount (Beverage + Mug)
Discount.find_or_create_by(
  item: nil, # No specific item linked, group discount
  discount_type: 'group',
  discount_percentage: 10.00, # 10% off on combo of Beverage + Mug
  combo_item_names: [beverage.id, mug.id].join(',')
)



puts "Created #{User.count} users"
puts "Created #{Order.count} orders"
puts "Created #{Item.count} items"
puts "Created #{OrderItem.count} order items"
