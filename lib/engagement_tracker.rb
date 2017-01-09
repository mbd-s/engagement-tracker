require 'csv'
require 'pp'
require 'httparty'
require 'dotenv'
Dotenv.load

require_relative 'engagement_tracker/post_processor'

#TODO pagination
#TODO tests
#TODO refactor: use HTTParty to accept array of params and interpolate into url
#TODO get page name and id from fb response

begin
  CSV.foreach('../input.csv') do |row|
    id, limit = row
    PostProcessor.new(id, limit).persist
  end
  puts "\nOpen output.csv to find your data.\n\n"
rescue Exception => e
  puts e.message
end
