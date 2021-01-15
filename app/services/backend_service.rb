class BackendService
  def self.location_exists(id)
    response = conn.get("/api/v1/location/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.save_location(user_id, location)
    conn.post("/api/v1/#{location}/#{user_id}")
  end

  def self.update_location(user_id, location)
    conn.patch("/api/v1/#{location}/#{user_id}")
  end

  def self.destroy_location(user_id)
    conn.delete("/api/v1/location/#{user_id}")
  end

  def self.conn
    Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')
  end
end
