require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  describe 'validations' do
    subject { FactoryBot.create(:like) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  describe 'callbacks' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, author: user) }

    it 'updates the likes_counter of post after creating a like' do
      expect do
        FactoryBot.create(:like, user:, post:)
      end.to change { post.reload.likes_counter }.by(1)
    end
  end
end
