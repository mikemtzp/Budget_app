require 'rails_helper'

RSpec.describe 'Group controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@gmail.com', password: 'password')
    @user.save
    sign_in(@user)
  end

  describe 'GET/categories' do
    before { get groups_path }

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the groups title' do
      expect(response.body).to include('CATEGORIES')
    end

    it 'Get 200 status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/categories/new' do
    before { get new_group_path }

    it 'Renders the add category template' do
      expect(response).to render_template('new')
    end

    it 'Should render the new group title' do
      expect(response.body).to include('NEW CATEGORY')
    end

    it 'Get 200 status' do
      expect(response).to have_http_status(200)
    end
  end
end
