require_relative 'client'
require_relative 'post'
require_relative 'reaction'
require_relative 'comment'

class PostProcessor
  def initialize(page_id, limit)
    @posts = Client.new(page_id, limit).post_nodes.flatten
  end

  def persist
    CSV.open('../output.csv', 'a+') do |csv|
      @posts.each do |post|
        Post.new(post).csv_lines.each { |line| csv << line }
      end
      puts "#{@posts.size} posts processed."
    end
  end

end
