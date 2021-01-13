class Favorite
  attr_reader :business_name, :yelp_business_id

  def initialize(data)
    @business_name = data[:attributes][:business_name]
    @yelp_business_id = data[:attributes][:yelp_business_id]
  end
end
