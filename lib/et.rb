require 'csv'
require 'pp'
require 'httparty'
require 'dotenv'
Dotenv.load

require_relative 'post_processor'

#TODO pagination
#TODO tests
#TODO refactor: use HTTParty to accept array of params and interpolate into url

begin
  CSV.foreach('../input.csv') do |row|
    id, limit = row
    PostProcessor.new(id, limit).persist
  end
rescue Exception => e
  puts e.message
end
