require "rails_helper"

RSpec.describe "the /users/:id/movies page", type: :feature do
  before :each do
    @user = create(:user)
    visit user_movies_path(@user)
  end

  describe "when a user visits the '/users/:id/movies' path they should see ..." do
    it "should display a button that redirects to the discover page" do
      click_button("Discover Page")
      expect(current_path).to eq(user_discover_path(@user))
    end
  end
end