class CategoryService
  def self.all_businesses(location, category, type)
    response = conn.get('/api/v1/yelp') do |req|
      req.params[:location] = location
      req.params[:service] = category
      req.params[:type] = type
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.a_business(location, category, type, id)
    response = conn.get('/api/v1/yelp') do |req|
      req.params[:location] = location
      req.params[:service] = category
      req.params[:type] = type
      req.params[:id] = id
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')
  end
end

