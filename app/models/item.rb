class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates_presence_of :name, :description, :unit_price

  def self.join_on_invoice_item(item_id)
    joins(:invoice_items).where(invoice_items: { id: item_id })
  end

  def self.join_on_invoice(item_id)
    joins(:invoices).where(invoices: { id: item_id })
  end
end
