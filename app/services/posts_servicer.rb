class PostsServicer
  attr_reader :client

  def initialize(client = PostsClient)
    @client = client
  end

  def generate_responses(queries)
    tags = queries.gsub(',', ' ').split
    tags.map do |tag|
      @client.get_tags(tag)[:posts]
    end.flatten.uniq
  end
end
