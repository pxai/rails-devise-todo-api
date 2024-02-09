require 'rails_helper'

RSpec.describe 'Sign In', type: :request do
  describe 'User Login' do
    context 'happy path' do
      it 'returns status code 200' do
        post user_registration_url, params: { user: { email: 'test@user.com', password: 'qwerty', password_confirmation: 'qwerty' } }
        post user_session_url, params: { user: { email: 'test@user.com', password: 'qwerty'} }
        #   user_registration_url,

        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(response).to be_successful

        expect(json['id']).to_not be(nil)
        expect(json['email']).to eq('test@user.com')
      end
    end

    context 'login fails' do
      it 'return 4xx on invalid email or password' do
        post user_session_url, params: { user: { email: 'user@sample.com', password: '12341234', password_confirmation: '12341234' } }

        json = JSON.parse(response.body)

        expect(response).to have_http_status(401)
        expect(response).to_not be_successful

        expect(json['error']).to eq('Invalid Email or password.')
      end
    end
  end
end