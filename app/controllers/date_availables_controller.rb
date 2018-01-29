class DateAvailablesController < ApplicationController
	before_action :find_user, only: [:create] 

	def create
		@date_available = current_user.date_availables.new(date_params)
		if @date_available.save

			redirect_to "/users/#{current_user.id}"
		else
			redirect_to "/users/#{@user.id}", :flash => { :errors => "Creation failed!"}
		end
	end

	private
	def date_params
		params.require(:date_available).permit(:start_date, :end_date)
	end

	def find_user
		@user = User.find_by(id: params[:id])
	end

end
