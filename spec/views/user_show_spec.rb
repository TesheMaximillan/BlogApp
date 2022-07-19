require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before :each do
    @user = User.create(name: 'Henry', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
    @post = Post.create(user: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
    visit user_path(@user)
  end

  it 'can see the user\'s profile picture' do
    expect(page).to have_css('img[src="https://example.com/photo.jpg"]')
  end

  it 'can see the user\'s name' do
    expect(page).to have_content('Henry')
  end

  it 'can see the number of posts each user has made' do
    expect(page).to have_content('1')
  end

  it 'can see the user\'s bio' do
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'can see the user\'s most recent three posts' do
    expect(page).to have_content('Post 1')
  end

  it 'can see a button that lets me view all of the user\'s posts' do
    expect(page).to have_link('Show all user post')
  end

  it 'when I click a user\'s post, I am redirected to the post show page' do
    click_on 'Post 1'
    expect(page).to have_current_path user_post_path(@user, @post)
  end

  it 'When I click to see all posts, I am redirected to the user\'s post index page' do
    click_on 'Show all user post'
    expect(page).to have_current_path user_posts_path(@user)
  end
end
