class SessionsController < ApplicationController

	def new
		render 'new'
	end

	#Controlador del login, mete en una sesion los 
	#id y username del usuario actual
	def create
		user = User.find_by_username(params[:session][:username])
		
    if (user.nil?)
    	flash[:warning] = "Username or Password incorrect"
      redirect_to new_session_path
    elsif (params[:session][:password] != user.password)
    	flash[:warning] = "Username or Password incorrect"
      redirect_to new_session_path
    else
    	session[:current_user_id] = user.id
    	session[:current_user_username] = user.username
    	redirect_to home_path
	  end 
	end

	def index
		render 'new'
	end


	def destroy
		reset_session
		redirect_to new_session_path
	end
end