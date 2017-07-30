class SessionsController < ApplicationController

	def new
	end 

	def create
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect_to '/'
		else 
			flash[:login_error] = 'Nice try. Please try your username and password again.'
			redirect_to '/login'
		end 
	end 

	def destroy
		session.clear
		redirect_to '/login'
	end 

end