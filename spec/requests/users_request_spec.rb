require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'check the status is successful' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get users_path
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /users/:id' do
    it 'check the status is successful' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end

    it 'render the show template' do
      get user_path(1)
      expect(response).to render_template('users/show')
    end
  end
end
