class PostsSerializer
  def self.posts(responses, sort = :id, direction = 'asc')
    {
      "posts": if direction == 'desc'
                 responses.sort_by { |k| k[sort] }.reverse

               else
                 responses.sort_by { |k| k[sort] }
               end
    }
  end
end
