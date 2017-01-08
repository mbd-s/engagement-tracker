require 'csv'
require 'pp'
require 'dotenv'
require 'jsonpath'
Dotenv.load

require_relative 'post_processor'

#TODO replace all double quotes (except interpolations) w/ single quotes
#TODO input.txt and format of expected input (and write this up in README),name of output file and where to find it

PostProcessor.new(305736219467790, 10).persist
