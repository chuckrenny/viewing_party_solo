require "rails_helper"

RSpec.describe "the /register page", type: :feature do
  before :each do
    visit register_path
  end
  # 2_user_registration
  # When a user visits the '/register' path they should see a form to register.

  # The form should include:

  # Name
  # Email (must be unique)
  # Register Button
  # Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.
  describe "When a user visits the '/register' path they should see a form to register" do
    it "displays a form that includes: name, email(unique), and register button" do
      fill_in 'Name', with: "John Smith"
      fill_in 'Email', with: "jsmith@aol.com"
      click_on 'Register'

      expect(current_path).to eq(user_path(User.all.last.id))
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

      expect(page).to have_content("Email has already been taken")
    end
  end
end