class SearchController < ApplicationController
  def index
  	#raise "#{params[:q]}"
    @services = Service.find(:all, :conditions => ['description LIKE ?', "hour"])
	render text: @services.to_json
  end
end
