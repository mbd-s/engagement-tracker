require 'csv'
require 'pp'
require 'dotenv'
Dotenv.load

require_relative 'post_processor'

#TODO in comments, replace dummy user_id with actual user_id

begin
  CSV.foreach('../input.csv') do |row|
    id, number_of_pages = row
    PostProcessor.new(id, number_of_pages).persist
  end
rescue Exception => e
  puts e.message
end
