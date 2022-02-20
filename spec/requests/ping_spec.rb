require 'rails_helper'
RSpec.describe 'API Ping' do
  describe 'GET /api/ping' do
    before { get api_ping_path }
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a success response' do
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:success]).to eq(true)
    end
  end
end
