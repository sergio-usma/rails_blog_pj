require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it 'is not valid without a text' do
      comment = build(:comment, text: nil)
      expect(comment).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'after_save' do
    it 'updates the post comments_counter' do
      user = create(:user)
      post = create(:post, author: user)
      expect {
        create(:comment, post: post, user: user)
      }.to change { post.reload.comments_counter }.by(1)
    end
  end
end

