class Tour < ApplicationRecord
	belongs_to :user
	has_many :users, through: :users_tours
	def full_street_address
 		[address,postcode,city,state].compact.join(',')
	end

	geocoded_by :full_street_address
	after_validation :geocode
end
