require "rails_helper"

RSpec.describe "the /users/:id page", type: :feature do
  # As a user,
  # When I go to a user dashbaord,
  # and click "Discover Movies" button,
  # I am redirected to a discover page /users/:id/discover, where :id is the user id of the user who's dashboard I was just on.
  before do
    @user = create(:user)
    visit user_path(@user)
  end

  describe "When a user visits the '/users/:id' path they should see user attributes" do
    it 'displys the user name title' do
      within('#page-title') do
        expect(page).to have_content("#{@user.name}'s Dashboard")
      end
    end

    it 'has a button to discover movies' do
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq(user_discover_path(@user))
      expect(page).to have_content("Discover Movies")
    end
  end
end