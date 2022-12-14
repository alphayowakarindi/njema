require 'rails_helper'

RSpec.describe 'Creating a group', type: :feature do
  before :each do
    user = User.create(name: 'Test user', email: 'test@gmail.com', password: '123456')
    login_as(user, scope: :user)
  end

  scenario 'adds a new group when name and icon is entered' do
    visit new_group_path
    fill_in('Name', with: 'Sports')
    attach_file('Icon', "#{Rails.root}/integration_test_image/test.jpg")
    click_on 'Submit'
    sleep(1)
    visit groups_path
    expect(page).to have_content('Sports')
  end

  scenario 'gives an error when no name is entered' do
    visit new_group_path
    attach_file('Icon', "#{Rails.root}/integration_test_image/test.jpg")
    click_on 'Submit'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'gives an error when no icon is entered' do
    visit new_group_path
    fill_in('Name', with: 'Sports')
    click_on 'Submit'
    expect(page).to have_content("Icon can't be blank")
  end
end
