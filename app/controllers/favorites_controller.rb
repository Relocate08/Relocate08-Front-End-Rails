
class FavoritesController < ApplicationController
  def create
    FavoritesFacade.save_favorite(current_user.id, params[:yelp_business_id], params[:business_name])
    flash[:success] = 'Business Saved!'
    redirect_to "/businesses/#{params[:yelp_business_id]}"
  end
end
