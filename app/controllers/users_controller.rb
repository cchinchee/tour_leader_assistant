class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update] 
	before_action :require_login, only: [:show, :edit]
	before_action :check_user, only: [:edit, :update, :destroy]

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			redirect_to root_path
		end	
	end	


	def login
		@user = User.find_by(email: params[:session][:email])
		if @user != nil && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id

			redirect_to "/users/#{@user.id}"
		else
			redirect_to root_path
		end
	end

	def logout
		sign_out
		redirect_to root_path
	end

	def update
		if current_user.id == @user.id
			@user.update(user_params)
		
			redirect_to "/users/#{@user.id}", :flash => { :success => "Update Successful!"} 
		else
			
			redirect_to "/users/#{@user.id}", :flash => { :errors => "Update failed!"}	
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :email, :users_avatar)
	end

	def find_user
		@user = User.find_by(id: params[:id])
	end

	def require_login
		if !logged_in?
			redirect_to root_path
		end	
	end

	def check_user
		if current_user.id != @user.id
			redirect_to root_path
		end

	end	
end
