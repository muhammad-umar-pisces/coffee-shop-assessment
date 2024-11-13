class Payment < ApplicationRecord
  belongs_to :order
  validates :amount_paid, presence: true
  validates :payment_method, presence: true
  validates :payment_status, inclusion: { in: ['pending', 'completed', 'failed'] }
end
