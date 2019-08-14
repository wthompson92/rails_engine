require 'csv'
 desc "Import merchants from csv file"
  task :import => [:environment] do
   file = "db/data/merchants.csv"
   CSV.foreach(file, :headers => true) do |row|
     Merchant.create(data: {name: row[1]})
  end
end
