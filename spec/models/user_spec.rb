require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Mike', email: 'mike@gmail.com', password: 'password')
    @user.save
  end

  it 'should required name to create a user' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should invalid a name\'s length bigger than 40 characters to create a user' do
    @user.name = 'M' * 41
    expect(@user).to_not be_valid
  end
end
