class FavoritesFacade
  def self.list_favorites(user_id)
    data = FavoritesService.all_favorites(user_id)
    data[:data].map do |biz|
      Favorite.new(biz)
    end
  end
end
