require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Henry', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
    @post = Post.create(user: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
    @comment = Comment.create(user: @user, post: @post, text: 'Lorem ipsum dolor sit amet')
    @like1 = Like.create(user: @user, post: @post)
    @like2 = Like.create(user: @user, post: @post)
    visit user_posts_path(@user)
  end

  it 'can see the user\'s profile picture' do
    expect(page).to have_css('img')
  end

  it 'can see the user\'s name' do
    expect(page).to have_content('Henry')
  end

  it 'can see the number of posts each user has made' do
    expect(page).to have_content('1')
  end

  it 'can see a post title' do
    expect(page).to have_content('Post #1')
  end

  it 'can see some of the posts body' do
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'can see the first comment' do
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'can see how many comments each post has' do
    expect(page).to have_content('1')
  end

  it 'can see the number of likes each post has' do
    expect(page).to have_content('2')
  end

  it 'can see a section for pagination if there are more than 5 posts' do
    expect(page).to have_content('Next')
    expect(page).to have_content('Previous')
  end
end