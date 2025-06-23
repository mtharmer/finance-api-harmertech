# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe '/user/registrations', type: :request do
  let!(:user) { create(:user, password: 'GoodPassword123') }
  let(:valid_headers) {
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  }

  describe 'POST /signup' do
    it 'returns success on valid signup' do
      post user_registration_url({ user: { email: 'some@email.com', password: 'GoodPassword123' } }), as: :json
      expect(response).to be_successful
    end

    it 'creates a user on valid signup credentials' do
      expect do
        post user_registration_url, params: { user: { email: 'another@email.com', password: 'GoodPassword123' } },
                                    as: :json
      end.to change(User, :count).by(1)
    end

    it 'returns 422 on invalid credentials' do
      post user_registration_url({ user: { email: 'some@email.com', password: '' } }), as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT /signup' do
    
    it 'returns success on valid password change' do
      put user_registration_url({
        user: {
          email: user.email,
          current_password: 'GoodPassword123',
          password: 'NewPassword123',
          password_confirmation: 'NewPassword123'
        }
      }), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'returns 422 on invaild credentials' do
      put user_registration_url({
        user: {
          email: user.email,
          current_password: 'GoodPassword123',
          password: 'short',
          password_confirmation: 'NewPassword123'
        }
      }), headers: valid_headers, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns 401 when not authenticated' do
      put user_registration_url({
        user: {
          email: user.email,
          current_password: 'GoodPassword123',
          password: 'NewPassword123',
          password_confirmation: 'NewPassword123'
        }
      }), as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
