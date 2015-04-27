class SearchController < ApplicationController
	def index
		

		#service_area = ServiceArea.where(:city=> params["service_area"].downcase)
		@services = Service.where(:service_type_id => params["service_type"])
		
    	
		
  	end
end
