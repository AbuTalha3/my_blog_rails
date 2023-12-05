require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render index page of users' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'should include the placeholder' do
      get '/users'
      expect(response.body).to include('Here is the users index page!')
    end
  end

  describe 'GET / show' do
    it 'should be a successfull respose for specfic id' do
      get '/users/:id'
      expect(response).to be_successful
    end

    it 'should render the show page of users' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'should include the placeholder' do
      get '/users/:id'
      expect(response.body).to include('Here is the users show page!')
    end
  end
end
