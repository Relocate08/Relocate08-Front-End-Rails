class CategoryService
  def self.all_businesses(location, category, type)
    response = conn.get("/api/v1/yelp/#{location}/#{category}/#{type}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.a_business(id)
    response = conn.get("/api/v1/yelp/businesses/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: ENV['HEROKU_BACKEND_DOMAIN'])
  end
end

