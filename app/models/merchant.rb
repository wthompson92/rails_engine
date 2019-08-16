class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def most_revenue
    Merchant.invoice_items
    binding.pry
  end
end
