require 'csv'
require 'pp'
require 'httparty'
require 'dotenv'
Dotenv.load

require_relative 'post_processor'

#TODO in comments, replace dummy user_id with actual user_id
#TODO tests

begin
  CSV.foreach('../input.csv') do |row|
    id, limit = row
    PostProcessor.new(id, limit).persist
  end
rescue Exception => e
  puts e.message
end
