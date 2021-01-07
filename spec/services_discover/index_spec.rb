require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit the Services Discover page' do
    it 'I see buttons to select what category to explore' do
      # Mock the Google OAuth login credentials
      visit services_discover_path

      expect(page).to have_content('Discover Services in Your Area')
      expect(page).to have_link('Utilites')
      expect(page).to have_link('Entertainment')
    end
  end
end