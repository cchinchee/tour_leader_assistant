class UsersController < ApplicationController
	before_action :find_user, only: [:show] 



	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			render "/"
		end	
	end	

	def show

	end

	def login
		@user = User.find_by(email: params[:session][:email])
		if @user != nil && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id

			redirect_to "/users/#{@user.id}"
		else
			render root_path
		end
	end

	def logout
		sign_out
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :email, :users_avatar)
	end

	def find_user
		@user = User.find_by(id: params[:id])
	end
end
