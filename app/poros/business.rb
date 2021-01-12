class Business
  attr_reader :id, :name, :image, :url, :location, :phone, :distance

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @image = data[:attributes][:image]
    @url = data[:attributes][:url]
    @location = data[:attributes][:location]
    @phone = data[:attributes][:phone]
    @distance = data[:attributes][:distance]
  end
end
