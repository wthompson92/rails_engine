# require 'csv'
#  desc "Import merchants from csv file"
#   task :import => [:environment] do
#    file = "db/data/merchants.csv"
#    CSV.foreach( "db/data/merchants.csv", :headers => true) do |row|
#      Merchant.create(row.to_hash)
#   end
# end
