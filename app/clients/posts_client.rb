class PostsClient
  def self.get_url(url, category = nil, sort_type = nil, direction = nil)
    conn = Faraday.new(url: 'https://api.hatchways.io') do |faraday|
      faraday.params[:tag] = category unless category.nil?
      faraday.params[:sortBy] = sort_type unless sort_type.nil?
      faraday.params[:direction] = direction unless direction.nil?
    end
    response = conn.get(url)

    JSON.parse(response.body)
  end

  def self.get_tags(category, sort_type = nil, direction = 'asc')
    get_url('/assessment/blog/posts', category, sort_type, direction)
  end
end
