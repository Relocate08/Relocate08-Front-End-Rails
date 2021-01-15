require 'rails_helper'

describe EventsFacade do
	it '.get_events()' do
		data = File.read('spec/fixtures/events/local_events.json')
		stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/events").
      to_return(status: 200, body: data, headers: {})

		event = EventsFacade.get_events(80211)

		expect(event.count).to eq(5)
    expect(event).to be_an(Array)
    expect(event.first).to be_a(Event)
    expect(event.first.id).to be_a(String)
    expect(event.first.attending_count).to be_a(Integer)
    expect(event.first.interested_count).to be_a(Integer)
    expect(event.first.is_free).to be(true).or be(false)
    expect(event.first.location).to be_a(String)
    expect(event.first.name).to be_a(String)
    expect(event.first.url).to be_a(String)
    expect(event.first.time_start).to be_a(String)
	end
end