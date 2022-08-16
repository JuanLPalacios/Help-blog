require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) do
      get '/users'
    end

    it 'response status was correct.' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template was rendered.' do
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('A list of ussers')
    end
  end

  describe 'GET /users/1' do
    before(:example) do
      get '/users/1'
    end

    it 'response status was correct.' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template was rendered.' do
      expect(response).to render_template('show')
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('User details')
    end
  end
end
