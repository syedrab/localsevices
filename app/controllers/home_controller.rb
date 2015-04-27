class HomeController < ApplicationController
  def index
  	@service_areas = ServiceArea.all.group(:city)
  	@service_types = ServiceType.all

  end
end
