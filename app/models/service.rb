class Service < ActiveRecord::Base
	belongs_to :company
	has_many :transactions
	has_many :service_area
	has_one :service_type
end
