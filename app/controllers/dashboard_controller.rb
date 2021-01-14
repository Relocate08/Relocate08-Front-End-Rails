# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @facade, @location = SearchFacade.location_exists(current_user.id)
  end
end
