class Event
	attr_reader :id, :name, :is_free, :url, :attending_count, :interested_count, :location, :time_start
	
	def initialize(data)
		@id = data[:id]
		@name = data[:attributes][:name]
		@is_free = data[:attributes][:is_free]
		@url = data[:attributes][:url]
		@attending_count = data[:attributes][:attending_count]
		@interested_count = data[:attributes][:interested_count]
		@location = data[:attributes][:location].join(' ')
		@time_start = data[:attributes][:time_start]
	end

	def readable_date
		time_start[0..9]
	end

	def readable_time
		time = time_start[11..15]
		require 'pry'; binding.pry
		time_int = time[0..1].to_i
		if time_int > 12
			new_hour = time_int - 12
			new_hour.to_s + time[2..4] + 'pm'
		else
			if time[0] == '0'
				time[1..4] + 'am'
			else
				time + 'am'
			end
		end
	end
end