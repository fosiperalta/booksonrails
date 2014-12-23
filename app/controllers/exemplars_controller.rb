class ExemplarsController < ApplicationController
  before_filter :has_user_and_book, :only => [:new, :create]
  protected
  def has_user_and_book
  end

  public
  
  def new
  end

  def create
  end

  def index
    exemplars = User.find(session[:current_user_id]).exemplars.all
    @books ||= Array.new
    exemplars.each do |e|
    	@books.push(e.book)
    end
  end

  def destroy
    #Eliminar un ejemplar de my books
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
    @exemplar = Exemplar.where(user_id: @user.id.to_s, book_id: @book.id.to_s)
    @exemplar.destroy_all
    flash[:notice] = "An exemplar of '#{@book.title}' deleted from My Books."
    redirect_to user_exemplars_path(@user)
  end

  def search_by_title
    exemplars = User.find(session[:current_user_id]).exemplars.all
    @books ||= Array.new
    exemplars.each do |e|
      @books.push(e.book)
    end

    @user = User.find(params[:user_id])
    @title = params[:title]
    allBooks = Book.all
    @searchedBooks ||= Array.new
    allBooks.each do |b|
      if (!b.title.nil? and !@title.nil?)
        if (b.title.downcase.include?(@title))
          @exemplar = Exemplar.where(user_id: @user.id.to_s, book_id: b.id.to_s)
          if(@exemplar == [])
            @searchedBooks.push(b)
          end
        end
      end
    end
    render 'index'
  end
end