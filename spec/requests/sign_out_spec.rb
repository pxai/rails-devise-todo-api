require 'rails_helper'

RSpec.describe 'Sign Out', type: :request do
  describe 'User registration' do
    context 'happy path' do
      let(:user) { FactoryBot.create(:user) }
      before do
        login_as(user, :scope => :user, :run_callbacks => false) # this last callback is necessary
      end
      it 'returns status code 200' do
        delete destroy_user_session_url
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(response).to be_successful

        expect(json['msg']).to eq('Session finished')
      end
    end
  end
end