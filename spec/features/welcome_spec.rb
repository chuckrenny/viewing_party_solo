require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    visit root_path
  end

  it 'displays the the Application Title' do
    within('#header') do
      expect(page).to have_content('Viewing Party')
    end
  end

  it 'displays a button to create a new user' do
    within('#new-user-button') do
      expect(page).to have_button('Create a New User')
    end
  end

  it "has an existing user's section and all emails" do
    within('#user-list') do
      expect(page).to have_content('Existing Users')
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user3.email)

      within("#user-#{@user1.id}") do
        click_link(@user1.email)
        expect(current_path).to eq(user_path(@user1))
      end
    end
  end

  it 'has a link to the root page' do
    expect(page).to have_link('Home', href: root_path)
  end
end
