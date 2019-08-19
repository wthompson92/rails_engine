# require 'csv'
#  desc "Import invoices from csv file"
#   task :import => [:environment] do
#    file = "db/data/invoices.csv"
#    CSV.foreach("db/data/invoices.csv", :headers => true) do |row|
#      Invoice.create(row.to_hash)
#   end
# end
