require 'csv'
require 'koala'
require 'dotenv'
Dotenv.load

class Facebook
  include Koala

  @graph = Koala::Facebook::API.new(ENV['oauth_access_token'])

  def self.pages_by_ids *ids, limit
    ids.each do |id|
      @graph.batch do |batch_api|
        batch_api.get_object(id) { |id| puts "Need to find last #{ limit } posts on #{ id["name"] }" }
      end
    end
  end

end
