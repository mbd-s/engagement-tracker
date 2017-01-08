class Reaction
  def initialize(page_id, post_id, post_type, node)
    @page_id = page_id
    @post_id = post_id
    @post_type = post_type
    @interaction_subtype = node['type']
    @user_id = node['id']
  end

  def to_csv
    [@user_id, @page_id, @post_id, @post_type, "reaction", @interaction_subtype]
  end
end
