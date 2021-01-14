class ServiceTypesController < ApplicationController
  def index
    @businesses = Rails.cache.fetch(
      "#{params[:location] + params[:services] + params[:type]}/search_facade/all_businesses", expires_in: 12.hours
    ) do
      SearchFacade.all_businesses(params[:location], params[:services], params[:type])
    end
  end

  def show
    @name = params[:name]
    @image = params[:image]
    @url = params[:url]
    @location = params[:location]
    @phone = params[:phone]
    @distance = params[:distance].to_f
  end
end
