class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
end
