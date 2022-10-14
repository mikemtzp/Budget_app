require 'rails_helper'

RSpec.describe 'Expense controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@gmail.com', password: 'password')
    @user.save
    @group = Group.new(name: 'Bank', icon: 'fa-solid fa-piggy-bank', user: @user)
    @group.save
    # @expense = Expense.new(name: 'Savings', amount: '20', user: @user)
    # @expense.save
    sign_in(@user)
  end

  describe 'GET/transactions' do
    before { get group_expenses_path(@group.id) }

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the expenses title' do
      expect(response.body).to include('TRANSACTIONS')
    end

    it 'Get 200 status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/categories/new' do
    before { get new_group_expense_path(@group.id) }

    it 'Renders the add transaction template' do
      expect(response).to render_template('new')
    end

    it 'Should render the new expense title' do
      expect(response.body).to include('NEW TRANSACTION')
    end

    it 'Get 200 status' do
      expect(response).to have_http_status(200)
    end
  end
end
