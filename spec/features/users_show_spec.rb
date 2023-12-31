require 'rails_helper'
RSpec.describe 'User Show', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Bofulo', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 3)
    @post1 = Post.create!(author: @user1, title: 'First Post', text: 'First text', comments_counter: 0,
                          likes_counter: 0)
    @post2 = Post.create!(author: @user1, title: 'Second Post', text: 'Second text', comments_counter: 0,
                          likes_counter: 0)
    @post3 = Post.create!(author: @user1, title: 'Third Post', text: 'Third text', comments_counter: 0,
                          likes_counter: 0)
  end
  describe 'show page' do
    it 'should display the profile picture of the user' do
      visit user_path(@user1)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
    end
    it 'should display the username of the user' do
      visit user_path(@user1)
      expect(page).to have_content(@user1.name)
    end
    it 'should display the number of posts of the user' do
      visit user_path(@user1)
      expect(page).to have_content(@user1.post_counter)
    end
    it 'should display the bio of the user' do
      visit user_path(@user1)
      expect(page).to have_content(@user1.bio)
    end
    it 'should display the user first 3 posts' do
      visit user_path(@user1)
      expect(page).to have_content('First text')
      expect(page).to have_content('Second text')
      expect(page).to have_content('Third text')
    end

    it 'should have the button to display all posts' do
      visit user_path(@user1)
      expect(page).to have_content('View All Posts')
    end

    it 'should redirect to the post show page when clicking on a post' do
      visit user_path(@user1)
      expect(page).to have_content('First text')
    end

    it "should redirect me to the user's post's index page when clicking on the 'View All Posts' button" do
      visit user_path(@user1)
      click_link 'View All Posts'
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end
