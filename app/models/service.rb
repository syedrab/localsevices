class Service < ActiveRecord::Base
	has_many :transactions
	has_one :service_type
	has_one :service_area
end
