require_relative 'client'
require_relative 'post'
require_relative 'reaction'
require_relative 'comment'

class PostProcessor
  def initialize(*page_ids, limit)
    posts = []
    page_ids.each { |id| posts << Client.new(id, limit).post_nodes }

    @posts = posts.flatten
  end

  def persist
    CSV.open('../output.csv', 'w') do |csv|
      @posts.each do |post|
        Post.new(post).to_csv.each { |p| csv << p }
      end
      puts "#{@posts.size} posts processed."
    end
  end

end
