require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:user)).to be_valid
    end

    it 'is not valid without a name' do
      expect(build(:user, name: nil)).not_to be_valid
    end

    it 'is valid only with a non-negative posts_counter' do
      expect(build(:user, posts_counter: -1)).not_to be_valid
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:posts).with_foreign_key('author_id') }
    it { is_expected.to have_many(:comments).with_foreign_key('user_id') }
    it { is_expected.to have_many(:likes).with_foreign_key('user_id') }
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do
      user = create(:user)
      create_list(:post, 5, author: user)

      expect(user.recent_posts.size).to eq(3)
      expect(user.recent_posts.first).to eq(user.posts.order(created_at: :desc).first)
    end
  end
end
