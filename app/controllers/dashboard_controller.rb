# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @facade, location = SearchFacade.location_exists(current_user.id)
    redirect_to address_path(location: location) if @facade == true
  end
end
