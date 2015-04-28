class Transaction < ActiveRecord::Base
	belongs_to :company
	belongs_to :user
	validates :user_id, presence: true
	validates :service_id, presence: true
end
