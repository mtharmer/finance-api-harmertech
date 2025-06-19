# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { build(:user) }
  let(:serialized) { described_class.new(user).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes id' do
    expect(attributes['id']).to eq(user.id)
  end

  it 'includes email' do
    expect(attributes['email']).to eq(user.email)
  end

  it 'includes createdAt' do
    expect(attributes['createdAt']).to eq(user.created_at.as_json)
  end
end
