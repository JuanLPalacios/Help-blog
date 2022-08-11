class User < ApplicationRecord
  validates :name, presence: { allow_blank: false, message: 'must not be blank.' }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end