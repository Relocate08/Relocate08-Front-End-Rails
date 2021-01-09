class ServiceTypesController < ApplicationController
  def index
    @businesses = SearchFacade.all_businesses(params[:location], params[:services], params[:type])
  end

  def show
    @business = SearchFacade.a_business(params[:location], params[:services], params[:type], params[:id])
    # conn = Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')

    # response = conn.get("/api/v1/yelp") do |req|
    #   req.params[:location] = params[:location]
    #   req.params[:service] = params[:service]
    #   req.params[:type] = params[:type]
    #   req.params[:id] = params[:id]
    # end

    # json = JSON.parse(response.body, symbolize_names: true)
    # @business = Business.new(json)
  end
end