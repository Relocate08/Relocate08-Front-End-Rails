require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit the Services Discover page' do
    it 'I see buttons to select what category to explore' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)

      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})

      no_favs = File.read('spec/fixtures/empty_favs.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: no_favs, headers: {})

      visit root_path
      click_link 'Login with Google'

      visit '/address'
      # expect(page).to have_content('Service Categories')
      # expect(page).to have_link('Utilites')
      # expect(page).to have_link('Entertainment')
    end
  end
end
