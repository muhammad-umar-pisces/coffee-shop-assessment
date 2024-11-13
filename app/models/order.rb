class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_items, dependent: :destroy
   has_many :items, through: :order_items

    enum :status, [ :new_order, :preparing, :completed, :canceled ]

   # Accepts nested attributes for associated order_items
   accepts_nested_attributes_for :order_items, allow_destroy: true
end