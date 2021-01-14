class FavoritesFacade
  def self.list_favorites(user_id)
    data = FavoritesService.all_favorites(user_id)
    data[:data].map do |biz|
      Favorite.new(biz)
    end
  end

  def self.save_favorite(user_id, yelp_business_id, business_name)
    FavoritesService.save_favorite(user_id, yelp_business_id, business_name)
  end

  def self.delete_favorite(user_id, yelp_business_id)
    FavoritesService.delete_favorite(user_id, yelp_business_id)
  end

  def self.show_favorite(business_id)
    data = FavoritesService.show_favorite(business_id)
    Business.new(data[:data])
  end
end
