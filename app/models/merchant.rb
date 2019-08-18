class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.random
   limit(1).order("RANDOM()")
  end

  def self.most_revenue
    joins.invoice_items
  end
end
