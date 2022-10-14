require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@gmail.com', password: 'password')
    @user.save
    @group = Group.new(name: 'Bank', icon: 'fa-solid fa-piggy-bank', user: @user)
    @group.save
    @expense = Expense.new(name: 'Savings', amount: '20', user: @user)
    @expense.save
  end

  it 'should require name to create an expense' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'should invalid a name\'s length bigger than 50 characters to create an expense' do
    @expense.name = 'M' * 51
    expect(@expense).to_not be_valid
  end

  it 'should require amount to create an expense' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'should require amount to be an integer' do
    @expense.amount = 'n'
    expect(@expense).to_not be_valid
  end

  it 'should require amount to be greater than 0' do
    @expense.amount = 0
    expect(@expense).to_not be_valid
  end
end
