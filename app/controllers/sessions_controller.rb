class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			flash[:success] = 'Login Succesful!'
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:danger] = 'There was a problem logging in.'
			redirect_to 'login'
		end
	end

	def destroy
		flash[:success] = 'Logged out.'
		session[:user_id] = nil
		redirect_to '/'
	end
end
