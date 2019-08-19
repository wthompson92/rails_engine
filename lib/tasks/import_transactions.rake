# require 'csv'
#  desc "Import transactions from csv file"
#   task :import => [:environment] do
#    file = "db/data/transactions.csv"
#    CSV.foreach("db/data/transactions.csv", :headers => true) do |row|
#      Transaction.create(row.to_hash)
#   end
# end
