require 'csv'
 desc "Import invoice items from csv file"
  task :import => [:environment] do
   file = "db/data/invoice_items.csv"
   CSV.foreach(file, :headers => true) do |row|
     InvoiceItem.create({
       item_id: row[1],
       invoice_id: row[2],
       quantity: row[3],
       unit_price: row[4]
     })
  end
end
