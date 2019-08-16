require 'csv'
 desc "Import invoices from csv file"
  task :import => [:environment] do
   file = "db/data/invoices.csv"
   CSV.foreach(file, :headers => true) do |row|
     Invoice.create({
       customer_id: row[1],
       merchant_id: row[2],
       status: row[3]
     })
  end
end
