require 'rails_helper'

RSpec.describe 'integration_tests', type: :feature do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@mail.com', password: 'password')
    @user.save
    @group = Group.new(name: 'Bank', icon: 'fa-solid fa-piggy-bank', user: @user)
    @group.save
    sign_in(@user)
  end

  it 'should show log in and sign up buttons in splash screen' do
    visit '/categories'
    click_on('Logout')
    expect(page.body).to include('LOG IN')
    expect(page.body).to include('SIGN UP')
  end

  it 'should show group_index as home page' do
    visit '/categories'
    expect(page.body).to include('CATEGORIES')
    expect(page).to have_content(@group.name)
  end

  it 'should redirect to expenses page of a clicked group' do
    visit '/categories'
    click_on(@group.name.to_s)
    sleep(0.1)
    expect(page.body).to include('TRANSACTIONS')
  end

  it 'should redirect to login after click on Logout button' do
    visit '/categories'
    click_on('Logout')
    expect(page.body).to include('LOG IN')
  end

  it 'should redirect to new_group after click on Add category button' do
    visit '/categories'
    click_on('Add category')
    sleep(0.1)
    expect(page.body).to include('NEW CATEGORY')
  end

  it 'should redirect to new_expense after click on Add transaction button' do
    visit "categories/#{@group.id}/transactions"
    click_on('Add transaction')
    sleep(0.1)
    expect(page.body).to include('NEW TRANSACTION')
  end
end
