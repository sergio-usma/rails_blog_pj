require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(250) }
    it { is_expected.to validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe '#recent_comments' do
    let(:post) { create(:post) }

    it 'returns the 5 most recent comments' do
      old_comments = create_list(:comment, 2, post:, created_at: 2.days.ago)
      new_comments = create_list(:comment, 3, post:, created_at: 1.day.ago)
      post.reload

      expect(post.recent_comments.size).to eq(5)
      expect(post.recent_comments).to eq(new_comments + old_comments)
    end
  end


  describe '#update_post_counter' do
    let(:user) { create(:user) }

    it 'updates the posts_counter of author' do
      create(:post, author: user)
      user.reload
      expect(user.posts_counter).to eq(1)
    end
  end
end
