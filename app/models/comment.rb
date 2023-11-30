class comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  after_create :increment_post_comments_counter

  private

  def increment_post_comments_count
    post.increment!(:comments_counter)
  end
end
