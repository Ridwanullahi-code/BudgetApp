require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  include ActionDispatch::TestProcess
  let(:user) { User.create(name: 'test', email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Test', icon: fixture_file_upload('icon.jpeg', 'image/jpeg'), author: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index, params: { group_id: group.id }
      expect(response).to render_template(:index)
    end

    it 'assigns @expenses with user expenses' do
      get :index, params: { group_id: group.id }
      expect(assigns(:expenses)).to eq(group.expenses)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, params: { group_id: group.id }
      expect(response).to render_template(:new)
    end

    it 'assigns a new expense to @expense' do
      get :new, params: { group_id: group.id }
      expect(assigns(:expense)).to be_a_new(Expense)
    end
  end
end
