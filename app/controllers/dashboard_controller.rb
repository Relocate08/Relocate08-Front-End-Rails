# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authorize
  def index
    @facade, @location = SearchFacade.location_exists(current_user.id)
    @favorites = FavoritesFacade.list_favorites(current_user.id)
  end
end
