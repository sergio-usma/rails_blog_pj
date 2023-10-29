require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with a post_id and user_id' do
    user = User.create(name: 'John Doe')
    post = Post.create(title: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id, author: user)
    like = Like.new(post_id: post.id, user_id: user.id)
    expect(like).to be_valid
  end

  it 'is invalid without a post_id' do
    user = User.create(name: 'John Doe')
    like = Like.new(user_id: user.id)
    expect(like).to_not be_valid
  end

  it 'is invalid without a user_id' do
    user = User.create(name: 'John Doe')
    post = Post.create(title: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id, author: user)
    like = Like.new(post_id: post.id)
    expect(like).to_not be_valid
  end
end
