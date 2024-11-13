class Item < ApplicationRecord
  # Add validations, relationships, and other logic as needed
  has_one :discount
  scope :available, -> { where(status: 'available') }
end