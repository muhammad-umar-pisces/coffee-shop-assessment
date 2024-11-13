class Discount < ApplicationRecord
  belongs_to :item
  validates :discount_type, inclusion: { in: ['individual', 'group'] }
end
