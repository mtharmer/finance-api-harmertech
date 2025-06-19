require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:debts) }
  end

  describe 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'building' do
    it 'can build a user' do
      user = build(:user, email: 'build@test.com')
      expect(user.email).to eq('build@test.com')
    end
  end
end
