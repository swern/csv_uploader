require 'rubygems'
require 'sinatra'
#delete if not using postgres
#require 'pg'
require 'haml'
require 'csv'
require 'mongo'
require 'json'

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'mydb')
db = client.database
coll = db.collection("myCollection")

#db = Mongo::Connection.new.db("mydb")

get '/' do
  haml :home
end
 
# Handle GET-request (Show the upload form)
get "/upload" do
  haml :upload
end      
    
# Handle POST request (Receive and save the uploaded file)
post '/upload' do
  file_data = params[:myfile][:tempfile].read


  #string_data = file_data.map {|row| row.map {|cell| cell.to_s } }
 # array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }

  #array_of_hashes.each do |td|

  	#db.collection.insert(td)
  
  #csv_rows  = CSV.parse(file_data, headers: true, header_converters: :symbol)
  
  #db.coll.insert(csv_rows)
  #coll.insert_one(csv_rows)
  #csv_rows.each do |row| 
  	#put in params
      #DB[:prospects].insert( :Id =>  row[:Id], :Title => row[:title] )
   #   db[:mydb].insert_many(row)
      #or it might be this to insert all the data
      #db[:mydb].insert_many(csv_rows)
      
    end
  return "File successfully uploaded"

end
