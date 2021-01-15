class ServicesController < ApplicationController
  before_action :authorize
  def utilities_index; end

  def recreation_index; end

  def homeservices_index; end
end
