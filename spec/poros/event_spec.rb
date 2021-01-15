require 'rails_helper'

describe Event do
	it 'exists' do
		attr = {id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
			type: 'events', 
			attributes: {
      attending_count: 69,
      id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
      interested_count: 65,
      is_canceled: false,
      is_free: true,
      location: ['300 W 11th Ave Ste A Denver, CO 80204'],
      name: 'UPON CLOSER REFLECTION Opening Reception and Exhibition',
      time_start: '2021-01-15T17:00:00-07:00',
      url: 'https://www.yelp.com/events/denver-upon-closer-reflection-opening-reception-and-exhibition?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_event_search&utm_source=hLVXR0MIhyJhliv5ar9z7g'
		}
	}

		event = Event.new(attr)
    expect(event).to be_a(Event)
    expect(event.name).to be_a(String)
    expect(event.attending_count).to be_a(Integer)
    expect(event.id).to be_a(String)
    expect(event.interested_count).to be_a(Integer)
    expect(event.is_free).to be(true).or be(false)
    expect(event.location).to be_a(String)
    expect(event.name).to be_a(String)
    expect(event.time_start).to be_a(String)
    expect(event.url).to be_a(String)
	end
	
	it '#readable_date' do
		attr = {id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
			type: 'events', 
			attributes: {
      attending_count: 69,
      id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
      interested_count: 65,
      is_canceled: false,
      is_free: true,
      location: ['300 W 11th Ave Ste A Denver, CO 80204'],
      name: 'UPON CLOSER REFLECTION Opening Reception and Exhibition',
      time_start: '2021-01-15T17:00:00-07:00',
      url: 'https://www.yelp.com/events/denver-upon-closer-reflection-opening-reception-and-exhibition?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_event_search&utm_source=hLVXR0MIhyJhliv5ar9z7g'
		}
	}

		event = Event.new(attr)

		expect(event.readable_date).to eq('2021-01-15')
	end

	it '#readable_time' do
		attr = {id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
			type: 'events', 
			attributes: {
      attending_count: 69,
      id: 'denver-upon-closer-reflection-opening-reception-and-exhibition',
      interested_count: 65,
      is_canceled: false,
      is_free: true,
      location: ['300 W 11th Ave Ste A Denver, CO 80204'],
      name: 'UPON CLOSER REFLECTION Opening Reception and Exhibition',
      time_start: '2021-01-15T17:00:00-07:00',
      url: 'https://www.yelp.com/events/denver-upon-closer-reflection-opening-reception-and-exhibition?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_event_search&utm_source=hLVXR0MIhyJhliv5ar9z7g'
		}
	}

		event = Event.new(attr)

		expect(event.readable_time).to eq('5:00pm')
	end
end