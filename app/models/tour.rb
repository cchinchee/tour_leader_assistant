class Tour < ApplicationRecord
	has_many :users
	def full_street_address
 		[address,postcode,city,state].compact.join(',')
	end

	geocoded_by :full_street_address
	after_validation :geocode
end
