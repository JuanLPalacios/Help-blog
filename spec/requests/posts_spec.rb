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

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('Here is a list of posts for a given user')
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

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('contents of a Post')
    end
  end
end
