class ToursController < ApplicationController
	before_action :find_tour, only: [:show, :edit, :update, :destroy]
	before_action :check_superadmin, only: [:all_tour]
	before_action :check_user, only: [:update, :destroy]

	def create
		@tour = current_user.tours.new(tour_params)
		if @tour.save
		redirect_to "/tours/#{@tour.id}"
		else
		redirect_to "/tours/new"
		end
	end

	def all_tour
		@tour = Tour.all
	end 
	def show
		@hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
		    marker.lat shop.latitude
		    marker.lng shop.longitude
		end
		@users_tour = UsersTour.where(tour_id: params[:id])
	end

	def update
		if current_user.id == @tour.user_id
			@tour.update(tour_params)
		
			redirect_to "/tours/#{@tour.id}", :flash => { :success => "Update Successful!"} 
		else
			
			redirect_to "/tours/#{@tour.id}", :flash => { :errors => "Update failed!"}	
		end
	end

	def destroy
		@tour.destroy
		redirect_to "/tours/all_tour"
	end


	private
	def tour_params
		params.require(:tour).permit(:start_date, :end_date, :customer_name, :customer_email, :customer_phone, :address, :city, :state, :postcode, :itinerary)
	end

	def find_tour
		@tour = Tour.find_by(id: params[:id])
	end 

	
	def check_user
		if current_user.id != @tour.user_id
			redirect_to root_path
		end
	end

	def check_superadmin
		if current_user.role != "superadmin"	
			redirect_to "/users/#{current_user.id}" 
		end
	end
end
