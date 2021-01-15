class ServiceCategoryController < ApplicationController
  def index

    number = params[:format].to_i
    if number >= 10000 && number.to_s.length <= 5

      @location = number
    else
      flash[:error] = 'Please enter a valid zipcode'
      redirect_to dashboard_path
    end
  end
end
