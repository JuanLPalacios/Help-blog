class Post < ApplicationRecord
  validates :title,
            presence: { allow_blank: false, message: 'must not be blank.' },
            length: { maximum: 250, message: 'must not exceed 250 characters' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :delete_all, validate: false
  has_many :likes, dependent: :destroy, validate: false
  belongs_to :author, class_name: 'User'

  after_create :increment_posts_counter
  before_destroy :decrement_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
