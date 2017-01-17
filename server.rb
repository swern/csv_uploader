require 'rubygems'
require 'sinatra'
#delete if not using postgres
#require 'pg'
require 'haml'
require 'csv'
require 'mongo'

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'mydb')
db = client.database

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
  csv_rows  = CSV.parse(file_data, headers: true, header_converters: :symbol)
  #remarks = 'none yet'
  csv_rows.each do |row| 
  	#put in params
      #DB[:prospects].insert( :Id =>  row[:Id], :Title => row[:title] )
      db[:mydb].insert_one(row)
      #or it might be this to insert all the data
      #DB[:mydb].insert_many(csv_rows)
      
    end
  return "File successfully uploaded"
end
