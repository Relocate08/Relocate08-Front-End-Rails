class ServiceTypesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://relocate-back-end-rails.herokuapp.com')

    response = conn.get("/api/v1/yelp") do |req|
      req.params[:location] = params[:location]
      req.params[:service] = params[:service]
      req.params[:type] = params[:type]
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @businesses = json[:data].map do |biz_data|
      Business.new(biz_data)
    end
  end
end