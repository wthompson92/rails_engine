require 'csv'
 desc "Import items from csv file"
  task :import => [:environment] do
   file = "db/data/items.csv"
   CSV.foreach(file, :headers => true) do |row|
     Item.create({
       name: row[1],
       description: row[2],
       unit_price: row[3],
       merchant_id: row[4]})

  end
end
