require 'rails_helper'

describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'check the status is successful' do
      get user_posts_path(1)
      expect(response).to have_http_status(200)
    end

    it 'check the body has a placeholder' do
      get user_posts_path(1)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'check the status is successful' do
      get user_post_path(1, 1)
      expect(response).to have_http_status(200)
    end

    it 'check the body has a placeholder' do
      get user_post_path(1, 1)
      expect(response.body).to include('Here is a single post with a collection of comments')
    end
  end
end
