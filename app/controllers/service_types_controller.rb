class ServiceTypesController < ApplicationController
  def index
    @businesses = SearchFacade.all_businesses(params[:location], params[:services], params[:type])
  end

  def show
    @business = SearchFacade.a_business(params[:id])
  end
end