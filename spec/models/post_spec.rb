require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Abu', posts_counter: 0)
    post = user.posts.build(title: 'Valid Post', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    user = User.create(name: 'Abu', posts_counter: 0)
    post = user.posts.build(comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is not valid with a long title' do
    user = User.create(name: 'Abu', posts_counter: 0)
    post = user.posts.build(title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end
end