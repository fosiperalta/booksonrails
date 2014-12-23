class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

	def show
	  id = params[:id] #Cogemos el id del meeting de la URI
	  @meeting = Meeting.find(id) 
	  #Por defecto va a mostrar app/views/meetings/show.html.haml
	end

	def new
		#genera la vista con el form para rellenar los datos
	end

	def create
			#coge los datos rellenados en el form de new y lanza el metodo
			#create! con esos parámetros
		@meeting = Meeting.new(params[:meeting])
		@meeting.creator = session[:current_user_username]
	  if @meeting.save
	  	flash[:notice] = "#{@meeting.title} was successfully created."
	    redirect_to meetings_path
	  else
	    render 'new'
	  end
	end

	def edit
		@meeting = Meeting.find params[:id]
	end

	def update
			#coge los datos del form de edit y lanza el metodo
			#update_atributes con esos parámetros
		 @meeting = Meeting.find params[:id]
	  if @meeting.update_attributes(params[:meeting])
	    flash[:notice] = "#{@meeting.title} was successfully updated."
	    redirect_to meeting_path(@meeting)
	  else
	    render 'edit'
	  end
	end

	def destroy
		#Eliminar un meeting
	  @meeting = Meeting.find(params[:id])
	  @meeting.destroy
	  flash[:notice] = " The meeting '#{@meeting.title}' was deleted."
	  redirect_to meetings_path
	end

		def sign_to_meeting
			#Creamos una asistencia con usuario+meeting
			flash[:notice] = "Assistance created"
			redirect_to meetings_path
	end

end