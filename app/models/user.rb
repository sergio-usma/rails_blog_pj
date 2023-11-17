class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Add validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
