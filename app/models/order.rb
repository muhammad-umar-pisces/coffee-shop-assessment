class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_items, dependent: :destroy
   has_many :items, through: :order_items
   has_many :notifications, dependent: :destroy

   enum :status, [ :new_order, :preparing, :completed, :canceled ]

   # Accepts nested attributes for associated order_items
   accepts_nested_attributes_for :order_items, allow_destroy: true

   def complete_order
     self.update(status: :completed, completed_at: Time.current)
     # Send notification to the customer after completing the order
     notify_customer
   end

   # Simulate sending notification to customer
   def notify_customer
     # Logic to send email/SMS/push notification goes here
     # Example: CustomerMailer.order_completed(self).deliver_now
     puts "Order ##{self.id} is ready. Notifying customer #{self.customer.id}."
   end

   def calculate_best_discount
    order = self
     # Initialize best discount as 0 (no discount applied)
     best_discount_value = 0.0

     # Step 1: Calculate the total price after individual discounts for each item
     order.order_items.each do |order_item|
       item_discount_value = apply_individual_discount(order_item)
       best_discount_value = [best_discount_value, item_discount_value].max
     end

     # Step 2: Calculate the total price after group discounts for the entire order
     group_discount_value = apply_group_discount(order)
     best_discount_value = [best_discount_value, group_discount_value].max

     # Return the best discount value (either individual or group)
     self.update(total_amount: (self.total_amount - best_discount_value) + self.calculate_tax)
   end

   # Calculate individual discount for an order item
   def apply_individual_discount(order_item)
     item_discount = order_item.item.discount
     if item_discount && item_discount.discount_type == 'individual'
       order_item.price_at_order * (item_discount.discount_percentage / 100.0)
     else
       0.0 # No discount
     end
   end

   # Calculate group discount for the entire order
   def apply_group_discount(order)
     group_discount_value = 0.0

     group_discounts = Discount.where(discount_type: 'group', combo_item_names: order.order_items.pluck(:id).join(","))
     return group_discount_value unless group_discounts.present?


     group_discounts.each do |group_discount|
       combo_item_ids = group_discount.combo_item_names.split(',').map(&:to_i)
       combo_items = order.order_items.select { |oi| combo_item_ids.include?(oi.item_id) }

       # Check if all combo items are present in the order
       if combo_items.size == combo_item_ids.size
         group_discount_value = [group_discount_value, order.total_amount * (group_discount.discount_percentage / 100.0)].max
       end
     end
     group_discount_value
   end

   def calculate_tax
    tax = []
    self.items.each do |item|
      tax << total_amount * (item.tax_rate / 100)
    end
    tax.sum
   end
end