class Business
	attr_reader :name, :image, :url, :location, :phone, :distance
	def initialize(data)
		@name = data[:name]
		@image = data[:image]
		@url = data[:url]
		@location = data[:location]
		@phone = data[:phone]
		@distance = data[:distance]
	end
end