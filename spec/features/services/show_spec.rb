require 'rails_helper'

describe 'As a logged in user' do
	describe 'When I click on a company from the service type index page' do
		it 'I am taken to that companys show page to see their info' do
			user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp?location=80211&service&type=Electricity").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities/Electricity'
		end
	end
end