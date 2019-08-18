class Customer < ApplicationRecord
  has_many :invoices
  validates_presence_of :first_name, :last_name

  def self.join_on_invoice(customer_id)
   joins(:invoices).where(invoices: {id: customer_id })
 end
end
