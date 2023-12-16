require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  let(:user) { User.new(name: 'Abu', photo: 'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gAAAA?rs=1&pid=ImgDetMain', bio: 'an autor in poland') }
  let(:post) { Post.new(title: 'post title', text: 'post text', author: user) }
  before { user.save }
  before { post.save }

  describe 'Index page' do
    before { visit user_posts_path(user) }
    it 'shows the user name' do
      expect(page).to have_content('user.name')
    end

    it "should display the user's profile picture" do
      visit user_posts_path(@user1)
      expect(page).to have_css("img[src*='https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gAAAA?rs=1&pid=ImgDetMain']")
    end

    it "should display the user's username" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.name)
    end

    it "should display the user's number of posts" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.post_counter)
    end

    it "should display the post's title" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.title)
    end

    it "should display some of the post's body" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.text)
    end

    it 'should display the first comments on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end

    it 'should display the number of comments on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.comment_counter)
    end

    it 'should display the number of likes on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.like_counter)
    end

    it "should redirect me to that post's show page when clicking on the post's title" do
      visit user_posts_path(@user1)
      click_link @post1.title
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end
  end
end
