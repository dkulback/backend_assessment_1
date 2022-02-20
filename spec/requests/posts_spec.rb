require 'rails_helper'
RSpec.describe 'API POSTS' do
  describe 'GET /api/posts' do
    context 'when params are valid' do
      it 'returns status code 200' do
        valid_params = { tags: 'science,tech,health', sortBy: 'likes', direction: 'desc' }
        VCR.use_cassette('valid_params') do
          get api_posts_path, params: valid_params
          expect(response).to have_http_status(200)
        end
      end
    end
    it 'returns a success response' do
      valid_params = { tags: 'science,tech,health', sortBy: 'likes', direction: 'desc' }
      VCR.use_cassette('valid_params') do
        get api_posts_path, params: valid_params
        json = JSON.parse(response.body)
        expect(json['posts'].count).to eq(69)
        expect(json['posts'].first['author']).to eq('Zackery Turner')
        expect(json['posts'].first['likes']).to eq(992)
        expect(json['posts'].last['id']).to eq(85)
        expect(json['posts'].last['likes']).to eq(25)
      end
    end
    context 'when tags parameter is missing' do
      it 'responds with an error message and status 400' do
        invalid_params = { sortBy: 'likes', direction: 'desc' }
        get api_posts_path, params: invalid_params

        expect(response.body).to match(/Tags parameter is required/)
        expect(response).to have_http_status(400)
      end
    end
    context 'when sortBy param is invalid' do
      it 'has an error response and status :bad_request' do
        invalid_params = { tags: 'science,tech,health', sortBy: 'people', direction: 'desc' }
        get api_posts_path, params: invalid_params

        expect(response.body).to match(/sortBy parameter is invalid/)
        expect(response).to have_http_status(400)
      end
    end
    context 'when direction param is invalid' do
      it 'has an error response and status :bad_request' do
        invalid_params = { tags: 'science,tech,health', sortBy: 'likes', direction: 'esc' }
        get api_posts_path, params: invalid_params
        expect(response.body).to match(/Direction parameter is invalid/)
        expect(response).to have_http_status(400)
      end
    end
  end
end
