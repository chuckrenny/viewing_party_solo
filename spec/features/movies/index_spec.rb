require 'rails_helper'

RSpec.describe 'the /users/:id/movies page', type: :feature do
  # When I visit the discover movies page,
  # and click on either the Top Movies button or the Search button,
  # I should be taken to the movies results page (users/:user_id/movies) where I see:

  # Title (As a Link to the Movie Details page)
  # Vote Average of the movie
  # Details: There should only be a maximum of 20 results. The above details should be listed for each movie.
  before :each do
    @user = create(:user)
    visit user_discover_path(@user)
  end

  describe "when a user visits the '/users/:id/movies' path they should see ..." do
    it 'has a button to return to the discover page', :vcr do
      click_button('Discover Top Rated Movies')

      expect(current_path).to eq(user_movies_path(@user))

      click_button('Discover Page')

      expect(current_path).to eq(user_discover_path(@user))
    end

    it 'should display the top 20 results for movie title & vote average', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user))

      within('#movie-238') do
        expect(page).to have_content('The Godfather')
        expect(page).to have_content('Vote Average 8.7')
      end
    end
  end
end
