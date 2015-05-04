class SearchController < ApplicationController
	def index
		temp_service_type = params["service_type_id"] ? params["service_type_id"] : params["service_types_id"]
		temp_service_area = params["service_area"] ? params["service_area"] : params["service_areas"]
		@services = Service.joins(:service_area).where(service_areas: { city: temp_service_area})
		if(temp_service_type)
			@services = @services.where(service_type_id: temp_service_type)
		end

		@services = @services.group("services.company_id")
  	end
end
