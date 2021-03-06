class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'Account successfully created!'
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:success] = 'Signup failed :('
			redirect_to 'signup'
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
