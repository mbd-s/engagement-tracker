require 'httparty'

class Client
  include HTTParty
  base_uri "https://graph.facebook.com/v2.8"
  default_params :access_token => ENV['FACEBOOK_ACCESS_TOKEN']

  attr_reader :post_nodes, :page_id

  def initialize(page_id, limit)
    @post_nodes = get_posts page_id, limit
    @page_id = page_id
  end

  #refactor: use HTTParty to accept array of params and interpolates into url
  def get_posts(page_id, limit)
    response = Client.get("/#{page_id}?fields=posts.limit(#{limit})%7Btype%2Creactions%7Bid%2Ctype%7D%2Ccomments%7Bid%7D%7D")
    if response.success?
      response["posts"]["data"]
    else
      raise.response
    end
  end

end
