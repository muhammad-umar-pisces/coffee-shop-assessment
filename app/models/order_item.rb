class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # Ensure price_at_order is a decimal
  validates :price_at_order, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
