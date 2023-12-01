class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_create :update_user_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    author.update(post_counter: author.posts.count)
  end
end