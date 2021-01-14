class EventsController < ApplicationController
	def index
		@events = EventsFacade.get_events(params[:location])
	end
end
