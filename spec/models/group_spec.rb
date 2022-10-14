require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@gmail.com', password: 'password')
    @user.save
    @group = Group.new(name: 'Bank', icon: 'fa-solid fa-piggy-bank', user: @user)
    @group.save
  end

  it 'should required name to create a group' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'should invalid a name\'s length bigger than 40 characters to create a group' do
    @group.name = 'M' * 41
    expect(@group).to_not be_valid
  end

  it 'should required icon to create a group' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
