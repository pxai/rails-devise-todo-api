require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    before do
      get root_url
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end