# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /users' do
    it 'returns a successful HTTP response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All Users')
      expect(response.body).to include('Here you can see all the users of the blog.')
    end
  end

  describe 'GET /users/:user_id' do
    context 'when the user exists' do
      it 'returns a successful HTTP response' do
        get user_path(user_id: user.id)
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get user_path(user_id: user.id)
        expect(response).to render_template(:show)
      end

      it 'includes correct content in the response body' do
        get user_path(user_id: user.id)
        expect(response.body).to include('User Profile')
        expect(response.body).to include(user.name)
        expect(response.body).to include('Number of posts:')
        expect(response.body).to include('Post')
        expect(response.body).to include('See all posts')
      end
    end

    context 'when the user does not exist' do
      it 'redirects to the users index path' do
        get user_path(user_id: 'nonexistent_id')
        expect(response).to redirect_to(users_path)
      end

      it 'sets an alert message' do
        get user_path(user_id: 'nonexistent_id')
        follow_redirect!
        expect(flash[:alert]).to eq('User not found.')
      end
    end
  end
end
