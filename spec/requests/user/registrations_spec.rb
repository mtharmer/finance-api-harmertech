# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe '/user/registrations', type: :request do
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
end
