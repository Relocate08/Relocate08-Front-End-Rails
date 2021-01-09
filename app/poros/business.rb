class Business
  attr_reader :id, :name, :image, :url, :location, :phone, :distance

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image]
    @url = data[:url]
    @location = data[:location]
    @phone = data[:phone]
    @distance = data[:distance]
  end
end
