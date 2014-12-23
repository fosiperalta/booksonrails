class BooksController < ApplicationController
  def index
    @books = Book.all
  end

	def show
	  id = params[:id] #Cogemos el id del libro de la URI
	  @book = Book.find(id) 
	  #Por defecto va a mostrar app/views/books/show.html.haml
	end

	def new
		#genera la vista con el form para rellenar los datos
	end

	def create
			#coge los datos rellenados en el form de new y lanza el metodo
			#create! con esos parámetros
		@book = Book.new(params[:book])
	  if @book.save
	  	flash[:notice] = "#{@book.title} was successfully created."
	    redirect_to books_path
	  else
	    render 'new'
	  end
	end

	def edit
		#genera la vista con el form con los datos existentes
	  @book = Book.find params[:id]
	end

	def update
			#coge los datos del form de edit y lanza el metodo
			#update_atributes con esos parámetros
		 @book = Book.find params[:id]
	  if @book.update_attributes(params[:book])
	    flash[:notice] = "#{@book.title} was successfully updated."
	    redirect_to book_path(@book)
	  else
	    render 'edit'
	  end
	end

	def destroy
		#Eliminar un libro
	  @book = Book.find(params[:id])
	  @book.destroy
	  flash[:notice] = "Book '#{@book.title}' deleted."
	  redirect_to books_path
	end

	def add_to_my_books
		#Añade el libro a la coleccion
		@user = User.find(session[:current_user_id])
		@book = Book.find(params[:book_id])
		#evitamos añadir un repetido
		@exemplar = Exemplar.where(:user_id => @user.id, :book_id => @book.id)
		if @exemplar.empty?
			@exemplar = Exemplar.new(:user_id => @user.id, :book_id => @book.id)
			if @exemplar.save
				flash[:notice] = "Book '#{@book.title}' has been added to My Books."
				redirect_to books_path
			else 
				redirect_to books_path
			end
		else
			flash[:warning] = "Book '#{@book.title}' was already in My Books."
			redirect_to books_path
		end
	end

	def add_to_my_books2
		#Añade el libro a la coleccion
		@user = User.find(session[:current_user_id])
		@book = Book.find(params[:book_id])
		#evitamos añadir un repetido
		@exemplar = Exemplar.where(:user_id => @user.id, :book_id => @book.id)
		if @exemplar.empty?
			@exemplar = Exemplar.new(:user_id => @user.id, :book_id => @book.id)
			if @exemplar.save
				flash[:notice] = "Book '#{@book.title}' has been added to My Books."
				redirect_to user_exemplars_path(@user)
			else 
				redirect_to user_exemplars_path(@user)
			end
		else
			flash[:warning] = "Book '#{@book.title}' was already in My Books."
			redirect_to user_exemplars_path(@user)
		end
	end
end