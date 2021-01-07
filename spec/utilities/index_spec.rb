require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit the Utilities Discover page' do
    xit 'should display utility companies and their contact information' do
      # Mock the Google OAuth login credentials
      visit utilities_discover_path

      expect(page).to have_content('Local Utilites')

      within '#<insert class representing all results>' do
        expect(page).to have_content(utility.name.to_s)
        expect(page).to have_content(utility.address.to_s)
        expect(page).to have_content(utility.phone.to_s)
      end
    end
  end
end
