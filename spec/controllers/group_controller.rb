require 'rails_helper'

describe GroupsController do
  include ActionDispatch::TestProcess
  let(:user) { User.create(name: 'test', email: 'test@example.com', password: 'password') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @groups with the user's groups" do
      get :index
      expect(assigns(:groups)).to eq(user.groups)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns @group with a new group' do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end
  end

  describe 'POST #create' do
    context 'when the group is successfully created' do
      it 'redirects to the groups page' do
        post :create, params: { group: { name: 'Test Group' } }
        expect(response).to have_http_status(200)
      end
    end

    context 'when the group is not successfully created' do
      it 'renders the new template' do
        post :create, params: { group: { name: '' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
