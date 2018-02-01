class Tour < ApplicationRecord
	require 'date'
	belongs_to :user
	has_many :users_tours, dependent: :destroy
	validates :start_date, :end_date, :customer_name, :address, :state, :city, :postcode, presence: true
	
	def full_street_address
 		[address,postcode,city,state].compact.join(',')
	end

	def num_of_days(start_date, end_date)
		start_date = Date.parse(start_date.to_s)
		end_date = Date.parse(end_date.to_s)
  		((end_date - start_date).to_i)+1
	end

	def check_num_of_tourleader
		@num = self.users_tours.count
	end	
	geocoded_by :full_street_address
	after_validation :geocode
end
