class ServiceCategoryController < ApplicationController
  def index
    number = params[:location].to_i
    if number >= 10_000 && number.to_s.length <= 5
      @location = number
    else
      flash[:error] = 'Please enter a valid zipcode'
      redirect_to dashboard_path
    end
  end
end
