require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:groups) }
    it { should have_many(:expenses) }
  end

  describe 'methods' do
    it 'should have a full_name method' do
      user = User.create(email: 'johndoe@example.com', password: 'password', name: 'John Doe')
      expect(user.name).to eq('John Doe')
    end
  end
end
