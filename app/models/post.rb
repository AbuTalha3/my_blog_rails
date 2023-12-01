class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes

  attribute :comments_couter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(3)
  end
  after_create :increment_user_posts_counter

  private

  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end
end
