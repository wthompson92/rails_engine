class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
  validates_presence_of :status

  def self.join_on_invoice_item(invoice_id)
    joins(:invoice_items).where(invoice_items: {id: invoice_id})
  end

  def self.join_on_transaction(invoice_id)
   joins(:transactions).where(transactions: {id: invoice_id})
 end
end
