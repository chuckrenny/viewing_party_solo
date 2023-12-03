require 'rails_helper'

RSpec.describe 'the users/:id/discover page', type: :feature do
  # 3_user_dashboard_page
  # As an user,
  # When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
  # I should see

  # Button to Discover Top Rated Movies
  # A text field to enter keyword(s) to search by movie title
  # A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page
  describe 'When a user visits the discover path' do
    before :each do
      @user = create(:user, name: 'John Smith', email: 'jsmith@aol.com')

      visit user_discover_path(@user)
    end

    it 'has a button to find top rated movies, a text field to enter keywords, a button to search by movie title based on keywords' do
      expect(page).to have_button('Discover Top Rated Movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Search by Movie Title')
    end

    it 'when the user clicks on the Discover Top Rated Movies button they are taken to /users/:id/movies', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user))
    end

    it 'when the user fills in the search field and clicks on the Search by Movie Title button, they are taken to /users/:id/movies', :vcr do
      fill_in :search, with: 'Shawshank Redemption'
      click_button 'Search by Movie Title'

      expect(current_path).to eq(user_movies_path(@user))
    end
  end
end
