
class FavoritesController < ApplicationController
  def show
    business_info = FavoritesFacade.show_favorite(params[:business_id])
    @id = business_info.id
    @name = business_info.name
    @image = business_info.image
    @url = business_info.url
    @location = business_info.location
    @phone = business_info.phone
    @distance = business_info.distance.to_f
  end

  def create
    FavoritesFacade.save_favorite(current_user.id, params[:yelp_business_id], params[:business_name])
    flash[:success] = 'Business Saved!'
    redirect_to dashboard_path
  end

  def destroy
    FavoritesFacade.delete_favorite(current_user.id, params[:business_id])
    flash[:success] = 'Favorite Deleted!'
    redirect_to dashboard_path
  end
end
