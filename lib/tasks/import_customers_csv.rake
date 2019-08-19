# require 'csv'
#  desc "Import customers from csv file"
#   task :import => [:environment] do
#    file = "db/data/customers.csv"
#    CSV.foreach("db/data/customers.csv", :headers => true) do |row|
#      Customer.create(row.to_hash)
#   end
# end
