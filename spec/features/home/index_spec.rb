# frozen_string_literal: true

require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit /' do
    it 'I can follow the link the Our Team link' do
      visit root_path
      click_on 'The Team'
      expect(current_path).to eq(team_path)
    end

    it 'I can follow the link the Privacy Policy page' do
      visit root_path
      click_on 'Privacy Policy'
      expect(current_path).to eq('/privacy')
    end

    it 'I see general information' do
      visit root_path
      expect(page).to have_content('Moving to a new place is exciting, but also stressful.')
      expect(page).to have_content('Relocate was developed to help alleviate the stress so you can focus on settling in.')
      expect(page).to have_content('What makes a home isn’t just the roof you sleep under, but the neighborhood around you. The average person moves approximately 11.7 times in their lifetime, and that means new gyms, new utilities, and new health care providers, among other things.')
      expect(page).to have_content("Relocate's user-friendly interface is a quick way to find and compare all the local businesses and necessities around you based on the location you provide.")
      expect(page).to have_link('Login with Google')
      expect(page).to have_link('Privacy Policy')
    end

    it 'Google OAuth logs in new user' do
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

      expect(current_path).to eq(dashboard_path)

      user_count = User.count
      expect(user_count).to eq(1)
      User.first


      expect(page).to have_link('Logout')
    end

    it 'Returning Google user is logged in' do
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

      user_count = User.count
      expect(user_count).to eq(1)

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_link 'Logout'
    end
  end
end
