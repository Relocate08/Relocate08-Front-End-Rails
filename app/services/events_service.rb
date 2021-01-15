class EventsService
	def self.fetch_events(location)
		conn = Faraday.new('https://relocate-back-end-rails.herokuapp.com')
		response = conn.get("api/v1/yelp/#{location}/events")
		JSON.parse(response.body, symbolize_names: true)
	end
end