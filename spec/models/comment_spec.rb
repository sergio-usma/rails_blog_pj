require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is invalid without a body' do
      user = User.create(name: 'John Doe')
      post = Post.create(title: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id, author: user)
      comment = Comment.new(post_id: post.id, user_id: user.id)
      expect(comment).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
