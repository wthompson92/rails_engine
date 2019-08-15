require 'csv'
 desc "Import customers from csv file"
  task :import => [:environment] do
   file = "db/data/customers.csv"
   CSV.foreach(file, :headers => true) do |row|
     Customer.create({
       first_name: row[1],
       last_name: row[2]})
  end
end
