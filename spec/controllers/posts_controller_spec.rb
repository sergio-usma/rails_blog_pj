# spec/requests/posts_spec.rb
require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /users/:user_id/posts' do
    context 'when user exists' do
      it 'returns a successful HTTP response' do
        get user_posts_path(user_id: user.id)
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get user_posts_path(user_id: user.id)
        expect(response).to render_template(:index)
      end

      it 'includes correct content in the response body' do
        get user_path(user_id: user.id)

        expect(response.body).to include('User Profile')
        expect(response.body).to include(user.name)
        expect(response.body).to include('User Photo')
        expect(response.body).to include('Number of posts:')
        expect(response.body).to include("#{user.name} Bio")

        user.posts.each do |post|
          expect(response.body).to include(post.title)
          expect(response.body).to include(post.text)
          expect(response.body).to include("Post #{post.id}")
        end

        expect(response.body).to include('See all posts')
      end
    end

    context 'when user does not exist' do
      it 'redirects to the users list with an alert' do
        get user_posts_path(user_id: 0)
        expect(response).to redirect_to(users_path)
        follow_redirect!
        expect(flash[:alert]).to match(/User not found./)
      end
    end
  end

  describe 'GET /users/:id/posts/:post_id' do
    context 'when post exists' do
      let(:post) { FactoryBot.create(:post, author: user) }

      it 'returns a successful HTTP response' do
        get user_post_path(id: user.id, post_id: post.id)
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get user_post_path(id: user.id, post_id: post.id)
        expect(response).to render_template(:show)
      end

      it 'includes the post title in the response body' do
        get user_post_path(id: user.id, post_id: post.id)
        expect(response.body).to include("Post Title: #{post.title}")
      end

      it 'includes the placeholder text for post details in the response body' do
        get user_post_path(id: user.id, post_id: post.id)
        expect(response.body).to include('Here you can see details of the post')
      end
    end
  end

  context 'when post does not exist' do
    it 'redirects to the users path with an alert' do
      get user_post_path(id: user.id, post_id: 0)
      expect(response).to redirect_to(users_path)
      follow_redirect!
      expect(flash.alert).to match(/Post not found./)
    end
  end
end
