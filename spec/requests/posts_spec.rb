require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/1/posts' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'response status was correct.' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template was rendered.' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/1/posts/1' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'response status was correct.' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template was rendered.' do
      expect(response).to render_template('show')
    end
  end
end
