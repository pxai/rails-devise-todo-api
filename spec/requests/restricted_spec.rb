require 'rails_helper'

RSpec.describe 'Restricted', type: :request do
  describe 'GET /restricted' do
    before do
      get restricted_url
    end
    
    it 'returns status code 302' do
      json = JSON.parse(response.body)
      expect(json['error']).to eq('You need to sign in or sign up before continuing.')
    end
  end

  describe 'GET /restricted with authentication' do
    let(:user) { FactoryBot.create(:user) }
    before do
      login_as(user, :scope => :user, :run_callbacks => false) # this last callback is necessary
      get restricted_url
    end
    
    it 'returns status code 302' do
      expect(response).to have_http_status(:ok)
      expect(json['msg']).to eq('ok, welcome to restricted')
    end
  end

  describe 'GET /restricted with after logout' do
    let(:user) { FactoryBot.create(:user) }
    before do
      login_as(user, :scope => :user, :run_callbacks => false) # this last callback is necessary
      get restricted_url
    end
    
    it 'returns error message' do
      expect(response).to have_http_status(:ok)
      expect(json['msg']).to eq('ok, welcome to restricted')
      logout(:user)

      get restricted_url
      json = JSON.parse(response.body)

      expect(json['error']).to eq('You need to sign in or sign up before continuing.')
    end
  end
end