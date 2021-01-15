require 'rails_helper'

describe 'As a user' do
	it 'I can see a list of local events' do
    stub_omniauth
		@user = create(:omniauth_mock_user, id: 1)
		set_location = File.read('spec/fixtures/location_search.json')
		stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
			.to_return(status: 200, body: set_location, headers: {})
		no_favs = File.read('spec/fixtures/empty_favs.json')
		stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
			.to_return(status: 200, body: no_favs, headers: {})
		visit root_path
		click_link 'Login with Google'

		visit '/dashboard'


		within('.event-search') do
			fill_in "Zipcode", with: 80211
		end

		local_events = File.read('spec/fixtures/events/local_events.json')
		stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/events").
      to_return(status: 200, body: local_events, headers: {})

		click_on "Find Events"

		expect(current_path).to eq('/events')
		expect(page).to have_content('UPON CLOSER REFLECTION Opening Reception and Exhibition')
		expect(page).to have_link('Event Website')
		expect(page).to have_content('Location: 300 W 11th Ave Ste A Denver, CO 80204')
		expect(page).to have_content('Date: 2021-01-15')
		expect(page).to have_content('Time: 5:00pm')
		expect(page).to have_content('FREE EVENT')
		expect(page).to have_content('Attending: 1')
		expect(page).to have_content('Interested: 0')
	end
end
