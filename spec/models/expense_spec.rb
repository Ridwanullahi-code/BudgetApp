require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@example.com', password: 'password') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }

    it 'is valid with a name and an amount' do
      expense = Expense.new(name: 'Test Expense', amount: 10, author: user)
      expect(expense).to be_valid
    end

    it 'is invalid without a name' do
      expense = Expense.new(amount: 10, author: user)
      expect(expense).to be_invalid
      expect(expense.errors[:name]).to include('can\'t be blank')
    end

    it 'is invalid without an amount' do
      expense = Expense.new(name: 'Test Expense', author: user)
      expect(expense).to be_invalid
      expect(expense.errors[:amount]).to include('can\'t be blank')
    end

    it 'is invalid with an amount of 0' do
      expense = Expense.new(name: 'Test Expense', amount: 0, author: user)
      expect(expense).to be_invalid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      expense = Expense.new(name: 'Test Expense', amount: 10, author: user)
      expect(expense.author).to eq(user)
    end
  end
end
