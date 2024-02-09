require 'rails_helper'

RSpec.describe 'Sign Up', type: :request do
  describe 'User registration' do
    context 'happy path' do
      it 'returns status code 200' do
        post user_registration_url, params: { user: { email: 'user@sample.com', password: '12341234', password_confirmation: '12341234' } }
        json = JSON.parse(response.body)
        
        expect(response).to have_http_status(:success)
        expect(response).to be_successful

        expect(json['id']).to_not be(nil)
        expect(json['email']).to eq('user@sample.com')
      end
    end

    context 'registration fails' do
      it 'returns status code 422 when password is too short' do
        post user_registration_url, params: { user: { email: 'user@sample.com', password: '1234', password_confirmation: '1234' } }
        json = JSON.parse(response.body)

        expect(response).to have_http_status(422)

        expect(json['errors']['password']).to_not be('is too short (minimum is 6 characters)')
      end

      it 'returns status code 422 when password is different' do
        post user_registration_url, params: { user: { email: 'user@sample.com', password: '123456', password_confirmation: '1234111' } }
        json = JSON.parse(response.body)

        expect(response).to have_http_status(422)

        expect(json['errors']['password_confirmation']).to_not be('doesn\'t match Password')
      end

      it 'returns status code 422 when user already exists' do
        post user_registration_url, params: { user: { email: 'user@sample.com', password: '12341234', password_confirmation: '12341234' } }
        post user_registration_url, params: { user: { email: 'user@sample.com', password: '12341234', password_confirmation: '12341234' } }
        json = JSON.parse(response.body)

        expect(response).to have_http_status(422)

        expect(json['errors']['email']).to_not be('has already been taken')
      end
    end
  end
end