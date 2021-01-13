# frozen_string_literal: true

require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit /' do
    it 'I can follow the link the Our Team link' do
      visit root_path
      click_on 'The Team'
      expect(current_path).to eq(team_path)
    end

    it 'I can follow the link the Privacy Policy link' do
      visit root_path
      click_on 'Privacy Policy'
      expect(current_path).to eq(privacy_path)
    end

    it 'I see general information' do
      app_description = "Moving to a new place is as exciting, but also stressful. Relocate was developed to help alleviate the stress so you can focus on settling in. What makes a home isn’t just the roof you sleep under, but the neighborhood around you. The average person moves approximately 11.7 times in their lifetime, and that means new gyms, new utilities, and new health care providers, among other things. Relocate's user-friendly interface is a quick way to find and compare all the local businesses and necessities around you based on the location you provide."
      visit root_path

      expect(page).to have_content('Welcome to Relocate')
      expect(page).to have_link('Login with Google')
      expect(page).to have_content(app_description)
      expect(page).to have_link('Privacy Policy')
    end

    it 'Google OAuth logs in new user' do
      user = User.new
      user.id = 1

      allow(User).to receive(:find_or_create_by).and_return(user)

      user_count = User.count
      expect(user_count).to eq(0)

      stub_omniauth
      user_count = User.count
      expect(user_count).to eq(0)

      visit root_path

      json_response = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/1").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.3.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      click_link 'Login with Google'

      expect(current_path).to eq(dashboard_path)

      user_count = User.count
      expect(user_count).to eq(1)
      User.first

      expect(page).to have_link('Logout')
    end

    it 'Returning Google user is logged in' do
      stub_omniauth
      create(:omniauth_mock_user)
      user_count = User.count
      expect(user_count).to eq(1)

      visit root_path
      user = User.last

      json_response = File.read('spec/fixtures/location_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.3.0'
          }).
          to_return(status: 200, body: json_response, headers: {})

      click_link 'Login with Google'
      user_count = User.count
      expect(user_count).to eq(1)

      expect(current_path).to eq(address_path)
      expect(page).to have_link 'Logout'
    end
  end
end
