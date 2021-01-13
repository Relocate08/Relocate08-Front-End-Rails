require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the dashboard page' do
    it 'should see a form to fill in a location of search' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit '/dashboard'

      within '.location-search' do
        fill_in :location, with: '80211'
        click_on 'Search Location'
      end

      expect(current_path).to eq('/address')
        #
        # expect(page).to have_button('Utilities')
        click_on 'Utilities'


      expect(current_path).to eq('/80211/utilities')
      expect(page).to have_content('Utilities')
      expect(page).to have_link('Electricity')
    end

    it "should redirect them if the user already has a saved location" do
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

       expect(current_path).to eq("/address")
    end
  end
end
