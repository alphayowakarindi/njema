require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    user = User.create(name: 'Gachero', email: 'gacheru@gmail.com', password: '123456',
                       password_confirmation: '123456')
    @entity = Entity.create(name: 'Radio', amount: 300)
    @entity.author = user
  end

  it 'is not valid without a name' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'is not valid if the name is too long' do
    @entity.name = 'a' * 41
    expect(@entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end
