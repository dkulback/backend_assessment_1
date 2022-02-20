require 'rails_helper'

RSpec.describe PostsServicer do
  describe '#generate_responses' do
    it 'runs returns api calls from the client' do
      servicer = PostsServicer.new
      VCR.use_cassette('posts_science') do
        actual = servicer.generate_responses('science')
        expected = Array

        expect(actual).to be_a(expected)
        expect(actual[0]).to be_a(Hash)
        expect(actual[0]).to have_key('author')
        expect(actual[0]).to have_key('authorId')
        expect(actual[0]).to have_key('id')
        expect(actual[0]).to have_key('popularity')
        expect(actual[0]).to have_key('reads')
        expect(actual[0]).to have_key('tags')
      end
    end
    describe '#tags' do
      it 'splits the queries into an array' do
        servicer = PostsServicer.new
        actual = servicer.tags('science,health,tech,education')
        expected = %w[science health tech education]

        expect(actual).to eq(expected)
      end
    end
  end
end
