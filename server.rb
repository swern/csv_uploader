require 'rubygems'
require 'sinatra'
require 'haml'
require 'csv'
require 'mongo'

db = Mongo::Connection.new.db("mydb")

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
  remarks = 'none yet'
  csv_rows.each do |row| 
  	#put in params
      #DB[:prospects].insert( :Id =>  row[:Id], :Title => row[:title] )
      #link up mongodb
    end
  return "File successfully uploaded"
end
