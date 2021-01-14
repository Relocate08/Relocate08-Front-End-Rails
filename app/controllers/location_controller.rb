class LocationController < ApplicationController
  def create
    SearchFacade.save_address(current_user.id, params[:location])
    redirect_to dashboard_path
  end

  def update
    SearchFacade.update_address(current_user.id, params[:location])
    redirect_to dashboard_path
  end

  def destroy
    SearchFacade.destroy_address(current_user.id)
    redirect_to dashboard_path
  end
end