# /spec/controllers/posts_controller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { { title: 'Sample Title', text: 'Sample text' } }
  let(:invalid_attributes) { { title: '', text: '' } }

  describe 'GET #index' do
    it 'assigns @posts and renders the index template' do
      post = user.posts.create!(valid_attributes)
      get :index, params: { user_id: user.id }
      expect(assigns(:posts)).to eq([post])
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post and renders the show template' do
      post = user.posts.create!(valid_attributes)
      get :show, params: { user_id: user.id, id: post.id }
      expect(assigns(:post)).to eq(post)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new post as @post' do
      get :new, params: { user_id: user.id }
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: { user_id: user.id, post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'assigns a newly created post as @post' do
        post :create, params: { user_id: user.id, post: valid_attributes }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, params: { user_id: user.id, post: valid_attributes }
        expect(response).to redirect_to([user, Post.last])
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved post as @post' do
        post :create, params: { user_id: user.id, post: invalid_attributes }
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 're-renders the new template' do
        post :create, params: { user_id: user.id, post: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
