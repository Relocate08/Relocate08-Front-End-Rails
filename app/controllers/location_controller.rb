class LocationController < ApplicationController
  def create
    if params[:location].to_i >= 10000 && params[:location].to_s.length <= 5
      SearchFacade.save_address(current_user.id, params[:location])
      redirect_to dashboard_path
    else
      flash[:error] = 'Please enter a valid zipcode'
      redirect_to dashboard_path
    end
  end

  def update
    if params[:location].to_i >= 10000 && params[:location].to_s.length <= 5
      SearchFacade.update_address(current_user.id, params[:location])
      redirect_to dashboard_path
    else
      flash[:error] = 'Please enter a valid zipcode'
      redirect_to dashboard_path
    end

  end

  def destroy
    SearchFacade.destroy_address(current_user.id)
    redirect_to dashboard_path
  end
end
