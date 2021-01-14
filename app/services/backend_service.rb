class BackendService
  def self.location_exists(id)
    response = conn.get("/api/v1/location/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')
  end
end
