class Company < ActiveRecord::Base
	has_many :services
	has_many :reviews
	belongs_to :user
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>", custom: "500x357>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
