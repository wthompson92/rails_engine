# require 'csv'
#  desc "Import items from csv file"
#   task :import => [:environment] do
#    file = "db/data/items.csv"
#    CSV.foreach("db/data/items.csv", :headers => true) do |row|
#      Item.create(row.to_hash)
#   end
# end
