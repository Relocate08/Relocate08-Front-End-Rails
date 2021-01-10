require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the dashboard page' do
    it 'should see a form to fill in a location of search' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      within '.location-search' do
        fill_in :location, with: '80211'
        click_on 'Search Location'
      end

      expect(current_path).to eq('/address')

      within '.buttons' do
        expect(page).to have_button('Utilities')
        click_on 'Utilities'
      end

      expect(current_path).to eq('/80211/Utilities')
      expect(page).to have_content('Utilities')
      expect(page).to have_link('Electricity')
    end
  end
end