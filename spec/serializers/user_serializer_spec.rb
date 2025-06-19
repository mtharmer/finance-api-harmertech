require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { build(:user) }
  let(:serialized) { UserSerializer.new(user).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes the expected attributes' do
    expect(attributes['id']).to eq(user.id)
    expect(attributes['email']).to eq(user.email)
    expect(attributes['createdAt']).to eq(user.created_at.as_json)
  end
end
