require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'should be succesful response' do
      get '/users/id/posts'
      expect(response).to have_http_status(200)
    end

    it 'should render the posts index file' do
      get '/users/id/posts'
      expect(response).to render_template(:index)
    end

    it 'should include the placeholder' do
      get '/users/id/posts'
      expect(response.body).to include('Here is the posts index page!')
    end
  end

  describe 'GET /show' do
    it 'should be a successfull response' do
      get '/users/:id/posts/:id'
      expect(response).to be_successful
    end

    it 'should render the posts show file' do
      get '/users/:id/posts/:id'
      expect(response).to render_template('posts/show')
    end

    it 'should include the placeholder' do
      get '/users/:id/posts/:id'
      expect(response.body).to include('Here is the posts show page!')
    end
  end
end
