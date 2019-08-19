class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.random
   limit(1).order("RANDOM()")
  end

  def self.most_revenue(quantity = 3)
    Merchant.select("merchants.*, SUM(invoice_items.unit_price*invoice_items.quantity) AS revenue")
            .group(:id)
            .joins([invoices: :transactions])
            .joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
            .order("revenue desc")
            .limit(quantity)
  end

  def self.single_merchant_revenue
    Merchant.joins([invoices: :transactions]).joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id").sum("invoice_items.unit_price*invoice_items.quantity")
  end

  def self.join_on_invoice(merchant_id)
    joins(:invoices).where(invoices: {id: merchant_id })
  end

  def self.join_on_item(merchant_id)
    joins(:items).where(items: {id: merchant_id })
  end
end
