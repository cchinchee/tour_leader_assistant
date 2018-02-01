class DateAvailable < ApplicationRecord
	belongs_to :user
	validate :check_overlapping_dates

	def check_overlapping_dates

		user.date_availables.each do |old_date|
			if self.id != old_date.id
				if overlap?(self, old_date)
				  return errors.add(:overlapping_dates, "The date has conflict with others date.")
				end
			end	
		end 	 
	end 

	def overlap?(x,y)
  		(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
	end
end
