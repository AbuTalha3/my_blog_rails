require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Abu', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 0)
    @user2 = User.create!(name: 'Maria', photo: 'https://unsplash.com/photos/2.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 0)
    @user3 = User.create!(name: 'Nimrat', photo: 'https://unsplash.com/photos/3.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 0)
  end

  describe 'index page' do
    it 'should display the username of all other users' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it 'should display the profile photo of all other users' do
      visit users_path
      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/2.jpg']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/3.jpg']")
    end

    it 'should display the number of posts each user has written' do
      visit users_path
      expect(page).to have_content("Posts: 3", count: 0)
      expect(page).to have_content("Posts: 5", count: 0)
      expect(page).to have_content("Posts: 7", count: 0)
    end

    it 'should redirect to that users show page when clicking on the username' do
      visit users_path
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
