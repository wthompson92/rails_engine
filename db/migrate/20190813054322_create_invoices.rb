class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :customer_id
      t.references :merchant_id
      t.string :status 

      t.timestamps
    end
  end
end
