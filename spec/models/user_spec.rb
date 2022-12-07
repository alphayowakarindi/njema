require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Alphayo', email: 'alphayo@gmail.com', password: '123456', password_confirmation: '123456') }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the name is too long' do
    subject.name = 'a' * 41
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a ivalid email' do
    subject.email = 'alphayo'
    expect(subject).to_not be_valid
  end

  it "is not valid if password doesn't match password confirmation" do
    subject.password = 'abcdefg'
    subject.password_confirmation = 'abcdef5'
    expect(subject).to_not be_valid
  end
end
