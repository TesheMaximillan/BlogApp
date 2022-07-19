require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Tomas', photo: 'https://usp.com/pto.png', bio: 'Web developer')
    @post = Post.create(user: @user, title: 'Dev in 2020', text: 'How to be a dev in 2020')
    @comment1 = Comment.create(user: @user, post: @post, text: 'This is comment 1')
    @comment2 = Comment.create(user: @user, post: @post, text: 'This is comment 2')
    Like.create(user: @user, post: @post)

    visit user_post_path(@user, @post)
  end

  it 'displays the post\'s title' do
    expect(page).to have_content('Dev in 2020')
  end

  it 'displays the author\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays how many comments the post has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'displays how many likes the post has' do
    expect(page).to have_content(@post.likes_counter)
  end

end
