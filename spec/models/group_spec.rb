require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    user = User.create(name: 'Gachero', email: 'gacheruuuu@gmail.com', password: '123456',
                       password_confirmation: '123456')
    @group = Group.create(name: 'Sports', icon: 'link/goes/here')
    @group.user = user
  end

  it 'is not valid without a name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'is not valid if the name is too long' do
    @group.name = 'a' * 41
    expect(@group).to_not be_valid
  end

  it 'is not valid without an icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
