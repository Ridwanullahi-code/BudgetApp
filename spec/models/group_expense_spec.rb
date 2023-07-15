require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Test Group', icon: fixture_file_upload('icon.jpeg', 'image/jpeg'), author: user) }
  let(:expense) { Expense.create(name: 'Test Expense', amount: 10, author: user) }

  describe 'validations' do
    it { should belong_to(:group) }
    it { should belong_to(:expense) }

    it 'is valid with a group_id and an expense_id' do
      group_expense = GroupExpense.new(group_id: group.id, expense_id: expense.id)
      expect(group_expense).to be_valid
    end

    it 'is invalid without a group_id' do
      group_expense = GroupExpense.new(expense_id: expense.id)
      expect(group_expense).to be_invalid
    end

    it 'is invalid without an expense_id' do
      group_expense = GroupExpense.new(group_id: group.id)
      expect(group_expense).to be_invalid
    end
  end

  describe 'associations' do
    it 'belongs to a group' do
      group_expense = GroupExpense.new(group_id: group.id, expense_id: expense.id)
      expect(group_expense.group).to eq(group)
    end

    it 'belongs to an expense' do
      group_expense = GroupExpense.new(group_id: group.id, expense_id: expense.id)
      expect(group_expense.expense).to eq(expense)
    end
  end
end
