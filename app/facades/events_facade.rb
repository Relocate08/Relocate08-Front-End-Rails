class EventsFacade
	def self.get_events(location)
		event_data = EventsService.fetch_events(location)
		event_data[:data].map do |event|
			Event.new(event)
		end
	end
end