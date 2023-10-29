require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with a title, comments_counter, likes_counter, author_id and author' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id, author: user)
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    user = User.create(name: 'John Doe')
    post = Post.new(comments_counter: 0, likes_counter: 0, author_id: user.id, author: user)
    expect(post).to_not be_valid
  end

  it 'is invalid with a negative comments_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Lorem ipsum', comments_counter: -1, likes_counter: 0, author_id: user.id, author: user)
    expect(post).to_not be_valid
  end
end
