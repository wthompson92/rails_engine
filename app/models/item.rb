class Item < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :name, :description, :unit_price

  def self.join_on_invoice_item(item_id)
    joins(:invoice_items).where(invoice_items: {id: item_id})
  end

end
