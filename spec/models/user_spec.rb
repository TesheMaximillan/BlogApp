require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John doe', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer and greater than or equal to 0' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#most_recent_three_posts' do
    it 'should return the most recent three posts' do
      expect(subject.most_recent_three_posts.count).to be <= 3
    end
  end

  describe 'user index page' do
    it 'can see the user name of all other users' do
      expect(subject.name).to eq('John doe')
    end

    it 'can see the profile picture of each user' do
      expect(subject.photo).to eq('https://example.com/photo.jpg')
    end

    it 'can see the number of posts each user has made' do
      user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
      Post.create(user:, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
      expect(user.posts_counter).to eq(1)
    end

    it 'when I click on a user, I am redirected to the user show page' do
      user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
      Capybara.visit '/users'
      Capybara.click_link user.name
      expect(Capybara.page).to have_content('John')
    end
  end

  describe 'user show page' do
    it 'can see the user\'s profile picture' do
      expect(subject.photo).to eq('https://example.com/photo.jpg')
    end

    it 'can see the user\'s name' do
      expect(subject.name).to eq('John')
    end

    it 'can see the number of posts each user has made' do
      user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
      Post.create(user:, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
      expect(user.posts_counter).to eq(1)
    end

    it 'can see the user\'s bio' do
      expect(subject.bio).to eq('Lorem ipsum dolor sit amet')
    end

    it 'can see the user\'s most recent three posts' do
      expect(subject.most_recent_three_posts.count).to be <= 3
    end

    it 'can see a button that lets me view all of the user\'s posts' do
      Capybara.visit "users/#{subject.id}"
      expect(Capybara.page).to have_link('Show all user post')
    end

    it 'when I click a user\'s post, it redirects to the post show page' do
      user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
      post = Post.create(user:, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
      Capybara.visit "users/#{user.id}"
      Capybara.click_link post.title
      expect(Capybara.page).to have_content('Post #1')
    end

    it 'when I click to see all posts, it redirects me to the user\'s post\'s index page' do
      user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet')
      Post.create(user:, title: 'Post 1', text: 'Lorem ipsum dolor sit amet')
      Capybara.visit "users/#{user.id}"
      Capybara.click_link 'Show all user post'
      expect(Capybara.page).to have_content('Post #1')
    end
  end
end
