# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe '/user/sessions', type: :request do
  let!(:user) { create(:user) }

  let(:headers) do
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end

  let(:valid_headers) do
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end

  describe 'POST /login' do
    it 'returns a successful response with valid credentials' do
      post user_session_url({ user: { email: user.email, password: user.password } }), as: :json
      expect(response).to be_successful
    end

    it 'returns 401 with invalid credentials' do
      post user_session_url({ user: { email: user.email, password: 'badpassword' } }), as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /logout' do
    it 'returns success' do
      delete destroy_user_session_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
