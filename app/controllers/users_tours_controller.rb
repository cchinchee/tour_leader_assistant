class UsersToursController < ApplicationController

	def new
		@tour = Tour.find_by(id: params[:tour_id])
		@start_date = @tour.start_date
		@end_date = @tour.end_date
		@tour_date = "#{@start_date}, #{@end_date}"
		@date = DateAvailable.where(start_date: (@start_date)..(@end_date))
	
	end

	

	def create

	end
	
end


