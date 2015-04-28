class SearchController < ApplicationController
	def index
		

		#@service_area = ServiceArea.where(:city=> params["service_area"].downcase).include(:service)
		#@services = Service.where(:service_type_id => params["service_type"]).joins(:servicea_area)
		#@service = Service.where(service_type_id: => params["service_type"]).joins(:service_area).where(service_areas: { city: => params["service_area"]})
		@services = Service.joins(:service_area).where(service_areas: { city: params["service_area"].downcase})
		if(params["service_type"])
			@services = @services.where(service_type_id: params["service_type"])
		end
    	
		
  	end
end
