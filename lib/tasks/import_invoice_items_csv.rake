# require 'csv'
#  desc "Import invoice items from csv file"
#   task :import => [:environment] do
#    file = "db/data/invoice_items.csv"
#    CSV.foreach("db/data/invoice_items.csv", :headers => true) do |row|
#      InvoiceItem.create(row.to_hash)
#   end
# end
