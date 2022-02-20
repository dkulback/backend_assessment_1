class PostsSerializer
  def self.posts(responses, sort = :id, direction = 'asc')
    {
      "posts": if direction == 'desc'
                 responses.sort_by { |k| k[sort.to_sym] }.reverse

               else
                 responses.sort_by { |k| k[sort.to_sym] }
               end
    }
  end
end
