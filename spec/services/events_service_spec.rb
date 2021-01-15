require 'rails_helper'

describe EventsService do
	it '.fetch_events' do
		local_events = File.read('spec/fixtures/events/local_events.json')
		stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/events").
      to_return(status: 200, body: local_events, headers: {})

		event_data = EventsService.fetch_events(80211)
		expect(event_data).to be_a(Hash)
		expect(event_data).to have_key(:data)

		results = event_data[:data]

		expect(results).to be_an(Array)

		result = results.first

		expect(result).to have_key(:attributes)
		expect(result[:attributes]).to be_a(Hash)

		attributes = result[:attributes]

    expect(attributes).to have_key(:name)
    expect(attributes[:name]).to be_a(String)

    expect(attributes).to have_key(:id)
    expect(attributes[:id]).to be_a(String)

    expect(attributes).to have_key(:is_free)
    expect(attributes[:is_free]).to be(true).or be(false)

    expect(attributes).to have_key(:is_canceled)
    expect(attributes[:is_canceled]).to be(true).or be(false)

    expect(attributes).to have_key(:url)
    expect(attributes[:url]).to be_a(String)

    expect(attributes).to have_key(:attending_count)
    expect(attributes[:attending_count]).to be_a(Integer)

    expect(attributes).to have_key(:interested_count)
    expect(attributes[:interested_count]).to be_a(Integer)

    expect(attributes).to have_key(:location)
    expect(attributes[:location]).to be_a(Array)

    expect(attributes).to have_key(:time_start)
    expect(attributes[:time_start]).to be_a(String)

    expect(attributes).to have_key(:id)
    expect(attributes[:id]).to be_a(String)

    expect(attributes).to have_key(:name)
    expect(attributes[:name]).to be_a(String)
	end
end