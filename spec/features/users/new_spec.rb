# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'the /register page', type: :feature do
  before :each do
    visit register_path
  end
  # 2_user_registration
  # When a user visits the '/register' path they should see a form to register.

  # The form should include:

  # Name
  # Email (must be unique)
  # Register Button
  # After user registration redirect to dashboard page '/users/:id'
  describe "When a user visits the '/register' path they should see a form to register" do
    it 'displays a form that includes: name, email(unique), and register button' do
      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: 'jsmith@aol.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Register'

      expect(current_path).to eq(user_path(User.all.last))
    end

    it 'the form should raise an error if name is empty' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'jsmith@aol.com'
      click_button 'Register'

      expect(current_path).to eq(register_path)

      expect(page).to have_content('Name can\'t be blank')
    end

    it 'the form should raise an error if email is empty' do
      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: ''
      click_button 'Register'

      expect(current_path).to eq(register_path)

      expect(page).to have_content("Email can't be blank")
    end

    it 'the form should raise an error if email is already in use' do
      @user = create(:user, name: 'Some Guy', email: 'jsmith@aol.com')

      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: 'jsmith@aol.com'
      click_button 'Register'

      expect(current_path).to eq(register_path)

      expect(page).to have_content('Email has already been taken')
    end
  end

  describe 'registration with authentication & bcrypt' do
    it 'should display a form to fill in attributes then redirects to dashboard' do
      fill_in 'Name', with: 'John Smith'
      fill_in 'Email', with: 'jsmith@aol.com'
      fill_in 'user_password', with: 'secure123'
      fill_in 'user_password_confirmation', with: 'secure123'
      click_on 'Register'

      expect(current_path).to eq(user_path(User.all.last))
    end
  end
end
