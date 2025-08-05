require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:conversations).dependent(:destroy) }
    it { should have_many(:appointments).through(:conversations) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'email format' do
    it 'is valid with a proper email format' do
      user = build(:user, email: 'test@example.com')
      expect(user).to be_valid
    end

    it 'is invalid with an improper email format' do
      user = build(:user, email: 'invalid-email')
      expect(user).not_to be_valid
    end
  end
end 