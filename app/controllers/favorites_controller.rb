
class FavoritesController < ApplicationController
  def show
    @business = FavoritesFacade.show_favorite(params[:business_id])
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
