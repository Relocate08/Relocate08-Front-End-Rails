require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit the Services Discover page' do
    it 'I see buttons to select what category to explore' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)
  
      has_location = File.read('spec/fixtures/location_search.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: has_location, headers: {})
  
      no_favs = File.read('spec/fixtures/empty_favs.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: no_favs, headers: {})

      visit root_path
      click_link 'Login with Google'

      expect(current_path).to eq(dashboard_path)
      click_button('Search With Saved Zipcode')

      expect(page).to have_content('Service Categories')
      
      expect(page).to have_content('Utilities')
      expect(page).to have_content('Recreation')
      expect(page).to have_content('Home Services')
    end
  end
end
