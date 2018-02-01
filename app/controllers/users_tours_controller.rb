class UsersToursController < ApplicationController

	def new
		@tour = Tour.find_by(id: params[:tour_id])
		@start_date = @tour.start_date
		@end_date = @tour.end_date
		@tour_date = "#{@start_date}, #{@end_date}"

		@date = DateAvailable.where(
			'(start_date <= :st AND end_date >= :st) AND (start_date <= :end AND end_date >= :end)', 
			{
				st: @start_date,
				end: @end_date
			}
		)
	end

	def create

		@tl = UsersTour.new(tl_params)
		if @tl.save
			redirect_to "/tours/#{@tl.tour_id}"
		else
			redirect_to root_path
		end	
	end
	
	private

	def tl_params
		params.require(:users_tour).permit(:tour_id, :user_id)
	end	
end


