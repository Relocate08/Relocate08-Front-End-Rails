class FavoritesService
  def self.save_favorite(user_id, yelp_business_id, business_name)
    response = conn.post("/api/v1/favorites/#{user_id}/#{yelp_business_id}") do |req|
      req.params[:business_name] = business_name
    end
  end

  def self.all_favorites(user_id)
    response = conn.get("/api/v1/favorites/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_favorite(user_id, yelp_business_id)
    response = conn.delete("/api/v1/favorites/#{user_id}/#{yelp_business_id}")
  end

  def self.conn
    Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')
  end
end