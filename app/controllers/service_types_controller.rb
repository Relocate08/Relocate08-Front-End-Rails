class ServiceTypesController < ApplicationController
  def index
    @businesses = SearchFacade.all_businesses(params[:location], params[:services], params[:type])
  end

  def show
    @id = params[:id]
    @name = params[:name]
    @image = params[:image]
    @url = params[:url]
    @location = params[:location]
    @phone = params[:phone]
    @distance = params[:distance].to_f
  end
end