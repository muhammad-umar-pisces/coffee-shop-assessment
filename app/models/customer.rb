class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :notifications, dependent: :destroy
end