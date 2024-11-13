class Item < ApplicationRecord
  # Add validations, relationships, and other logic as needed
  scope :available, -> { where(status: 'available') }
end