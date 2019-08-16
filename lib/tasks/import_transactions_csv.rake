require 'csv'
 desc "Import transactions from csv file"
  task :import => [:environment] do
   file = "db/data/transactions.csv"
   CSV.foreach(file, :headers => true) do |row|
     Transaction.create({
      invoice_id: row[1],
      credit_card_number: row[2],
      result: row[4]
       })
  end
end
