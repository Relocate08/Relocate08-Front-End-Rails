require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the dashboard page' do
    xit 'should see a form to fill in a location of search' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/location_search_null.json')

      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v1.3.0'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      visit '/dashboard'


      json_response = File.read('spec/fixtures/location_search.json')
      stub_request(:post, "https://relocate-back-end-rails.herokuapp.com/api/v1/80211/#{user.id}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      within '.location-search' do
        fill_in :location, with: '80211'
        click_on 'Save Location'
      end

      expect(current_path).to eq(dashboard_path)


      within '.location-search' do
        click_button 'Search With Saved Zipcode'
      end

      expect(current_path).to eq(address_path)
      click_on 'Utilities'

      expect(current_path).to eq('/80211/utilities')
      expect(page).to have_content('Utilities')
      expect(page).to have_link('Electricity')
    end

    xit 'should redirect them if the user already has a saved location' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      json_response = File.read('spec/fixtures/location_search.json')

      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v1.3.0'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      visit '/dashboard'

      expect(current_path).to eq('/address')

    end

    xit 'not search with an invalid zipcode' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v1.3.0'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      visit '/dashboard'

      within '.location-search' do
        fill_in :location, with: '3012q'
        click_on 'Save Location'
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Please enter a valid zipcode')

      within '.location-search' do
        fill_in :location, with: '****'
        click_on 'Save Location'
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Please enter a valid zipcode')
    end

    it 'If I have favorites saved, I see them' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)

      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})

      have_favs = File.read('spec/fixtures/get_favorite.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: have_favs, headers: {})

      visit root_path
      click_link 'Login with Google'

      expect(page).to have_link('Xcel Energy')
    end

    it 'If I do not have favorites saved, I do not see any' do
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

      expect(page).to have_content('You have no favorites.')

    xit 'should see button appear if location exists' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/location_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit '/dashboard'

      expect(page).to have_button('Search With Saved Zipcode')
    end

    it "can not be accessed if not logged in" do

      visit '/dashboard'
      expect(current_path).to eq("/")

      within(".custom-alert") do
        expect(page).to have_content("You must be logged in")
      end
    end
  end
end
