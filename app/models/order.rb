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
end