class Comment
  def initialize(page_id, post_id, post_type, node)
    @page_id = page_id
    @post_id = post_id
    @post_type = post_type
    @user_id = node['from']['id']
  end

  def to_csv
    [@user_id, @page_id, @post_id, @post_type, 'comment']
  end
end
