class UsersController < ApplicationController
	def show
	  id = params[:id] #Cogemos el id del user de la URI
	  @user = User.find(id)
	end

	def new
		#genera la vista con el form para rellenar los datos
	end

	def create
			#coge los datos rellenados en el form de new y lanza el metodo
			#create! con esos parámetros
		@user = User.new(params[:user])
	  if @user.save
	  	flash[:notice] = "#{@user.username} was successfully created."
	    redirect_to new_session_path
	  else
	    render 'new'
	  end
	end

	def update
			#coge los datos del form de edit y lanza el metodo
			#update_atributes con esos parámetros
		@user = User.find params[:id]
		@user.name = params[:user][:name]
		@user.surname = params[:user][:surname]
#		@user.birth_date = params[:user][:birth_date]
		@user.birth_date = Date.civil(params[:user]["birth_date(1i)"].to_i,params[:user]["birth_date(2i)"].to_i,params[:user]["birth_date(3i)"].to_i)
		@user.username = params[:user][:username]
		@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		@user.save

#		@user.update_attributes(params[:user])
	  if @user.errors.empty?
	    flash[:notice] = "#Account data was successfully updated."
	    redirect_to user_path(@user)
	  else
	    render 'edit'
	  end
	end

end