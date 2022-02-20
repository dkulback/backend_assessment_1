require 'rails_helper'

RSpec.describe PostsClient do
  let(:posts_client) { PostsClient }
  describe '::get_tags' do
    it 'returns a list of posts filted by the tag science' do
      VCR.use_cassette('posts_science') do
        posts = posts_client.get_tags('science')
        post = posts[:posts].first

        expect(posts).to be_a(Hash)
        expect(posts[:posts]).to be_a(Array)

        expect(post).to be_a(Hash)

        expect(post).to have_key(:id)
        expect(post[:id]).to be_a(Integer)

        expect(post).to have_key(:author)
        expect(post[:author]).to be_a(String)

        expect(post).to have_key(:authorId)
        expect(post[:authorId]).to be_a(Integer)

        expect(post).to have_key(:likes)
        expect(post[:likes]).to be_a(Integer)

        expect(post).to have_key(:reads)
        expect(post[:reads]).to be_a(Integer)

        expect(post).to have_key(:popularity)
        expect(post[:popularity]).to be_a(Float)
      end
    end
  end
end
