require 'rails_helper'

RSpec.describe 'User can Log In' do
  it 'can log in with valid credentials' do
    visit register_path
    fill_in 'Name', with: 'John Smith'
    fill_in 'Email', with: 'jsmith@aol.com'
    fill_in 'user_password', with: 'secure123'
    fill_in 'user_password_confirmation', with: 'secure123'
    click_on 'Register'

    visit root_path

    click_on 'Log In'

    expect(current_path).to eq(login_path)
    fill_in :email, with: 'jsmith@aol.com'
    fill_in :password, with: 'secure123'

    click_on 'Log In'

    expect(current_path).to eq(user_path(User.all.last))
    expect(page).to have_content('Welcome, John Smith')
  end

  xit 'cannot login in with bad credentials' do
    user = User.create!(username: 'funbucket13', password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: 'incorrect password'

    click_on 'Log In'

    expect(current_path).to eq(login_path)

    expect(page).to have_content('Sorry, wrong password')
  end
end