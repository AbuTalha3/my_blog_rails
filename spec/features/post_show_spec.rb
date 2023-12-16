require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Abu', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 1)
    @post1 = Post.create!(author: @user1, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 1)
    @comment1 = Comment.create!(post: @post1, user: @user1, text: 'Hi Abu!')
    @comment2 = Comment.create!(post: @post1, user: @user1, text: 'Hi Abu!')
    @like1 = Like.create!(post: @post1, user: @user1)
  end

  describe 'Show page' do
    it "should display the post's title" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.title)
    end

    it "should display the post's author" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@user1.name)
    end

    it "should display the post's number of comments and likes" do
      visit "/users/#{@user1.id}/posts/#{@post1.id}"
      user_post = @user1.posts.find_by(id: @post1)
      expect(page).to have_content(@post1.comments.count)
      expect(page).to have_content(@post1.likes.count)
    end

    it "should display the post's body" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.text)
    end

    it 'should display the username of each commentator' do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@user1.name)
    end

    it 'should display the text of each comment' do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
  end
end
