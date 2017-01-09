class Post
  attr_reader :reactions, :comments
  def initialize(node)
    @page_id, @id = node['id'].split('_')
    @post_type = node['type']
    @node = node
  end

  def csv_lines
    reactions(@node).map { |r| r.to_csv } + comments(@node).map { |c| c.to_csv }
  end

  private

  def reactions(node)
    if node['reactions']
      node['reactions']['data'].map { |r| Reaction.new(@page_id, @id, @post_type, r) }
    else
      []
    end
  end

  def comments(node)
    if node['comments']
      node['comments']['data'].map { |c| Comment.new(@page_id, @id, @post_type, c)}
    else
      []
    end
  end
end