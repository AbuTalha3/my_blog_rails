require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'name1', post_counter: 0) }
  let(:post) { user.posts.create(title: 'title', comments_counter: 0, likes_counter: 0) }

  it 'should update posts comment counter' do
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)

    post.reload

    expect(post.comments_counter).to eq 5
  end
end