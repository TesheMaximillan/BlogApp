require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'check the status is successful' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'check the body has a placeholder' do
      get users_path
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /users/:id' do
    it 'check the status is successful' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end

    it 'check the body has a placeholder' do
      get user_path(1)
      expect(response.body).to include('Show a specific user')
    end
  end
end
