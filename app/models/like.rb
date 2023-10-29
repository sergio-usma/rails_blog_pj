class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_counter

  validates :user_id, uniqueness: { scope: :post_id } # To ensure a user can only like a post once

  private

  def update_post_counter
    post.update(likes_counter: post.likes.count)
  end
end
