require 'rubygems'
require 'sinatra'
require 'haml'
require 'csv'
 
# Handle GET-request (Show the upload form)
get "/upload" do
  haml :upload
end      
    
# Handle POST-request (Receive and save the uploaded file)
post '/upload' do
  file_data = params[:myfile][:tempfile].read
  csv_rows  = CSV.parse(file_data, headers: true, header_converters: :symbol)
  owner = 'tim@xxxx.jp'
  remarks = 'none yet'
  csv_rows.each do |row| 
      DB[:prospects].insert( :first =>  row[:first], :last => row[:last], :designation => row[:designation], :email => row[:email], :phone => row[:phone], :company => row[:company], :industry => row[:industry], :city => row[:city], :country => row[:country], :status => row[:status],  :remarks => remarks, :owner => owner )
    end
  return "File successfully uploaded"
end
