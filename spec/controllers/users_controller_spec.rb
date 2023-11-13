require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # Assuming you are using FactoryBot for test setup
  let!(:users) { create_list(:user, 5) }

  describe 'GET #index' do
    before { get :index }

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'loads all users into @users' do
      expect(assigns(:users)).to match_array(users)
    end
  end

  describe 'GET #show' do
    context 'when the user exists' do
      let(:user) { users.first }
      let!(:posts) { create_list(:post, 3, author: user) }

      before { get :show, params: { id: user.id } }

      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'loads the user into @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'loads recent posts of the user into @posts' do
        expect(assigns(:posts)).to match_array(user.recent_posts)
      end
    end

    context 'when the user does not exist' do
      it 'raises a RecordNotFound error' do
        expect { get :show, params: { id: 9999 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

