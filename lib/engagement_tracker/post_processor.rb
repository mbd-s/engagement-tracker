# frozen_string_literal: true

require_relative 'client'
require_relative 'post'
require_relative 'reaction'
require_relative 'comment'

class PostProcessor
  def initialize(page_id, limit)
    @posts = Client.new(page_id, limit).post_nodes.flatten
  end

  def persist
    i = 0
    CSV.open('../output.csv', 'a+') do |csv|
      @posts.each do |post|
        Post.new(post).csv_lines.each do |line|
          csv << line
          i += 1
        end
      end
      puts "\nProcessed #{@posts.size} posts from Facebook page no. #{parse_page_id(@posts)}."
      puts "Collected #{i} reactions and comments.\n"
    end
  end

  private

  def parse_page_id(posts)
    posts[0]['id'].split(/_/)[0]
  end
end
