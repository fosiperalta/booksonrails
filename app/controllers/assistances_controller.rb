class AssistancesController < ApplicationController
  before_filter :has_user_and_meeting, :only => [:new, :create]
  protected
  def has_user_and_meeting
  end

  public
  
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:user_id])
    @meeting = Meeting.find(params[:id])
    exemplars = User.find(session[:current_user_id]).exemplars.all
    @books ||= Array.new
    exemplars.each do |e|
    #Book.all.each do |e|
      if(!e.book.nil?)
        @books.push(e.book)
      end
    end
  end

  def index
    assistances = User.find(session[:current_user_id]).assistances.all
    @meetings ||= Array.new
    assistances.each do |a|
    	@meetings.push(a.meeting)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @meeting = Meeting.find(params[:id])
    @assistance = Assistance.where(user_id: @user.id.to_s, meeting_id: @meeting.id.to_s)
    @assistance.destroy_all
    flash[:warning] = "Assistance to '#{@meeting.title}' removed"
    redirect_to user_assistances_path(@user)
  end

  def take_book
    @user = User.find(params[:user_id])
    @meeting = Meeting.find(params[:assistance_id])
    @book = Book.find(params[:format])
    @assistance = Assistance.where(user_id: @user.id.to_s, meeting_id: @meeting.id.to_s).last
    if @assistance.nil?
      @assistance = Assistance.new(user_id: @user.id.to_s, meeting_id: @meeting.id.to_s, books: [])
      @assistance.save
      flash[:notice] = "Assistance created"
    end
    @assistance.books.push(@book.id)
    @assistance.save
    flash[:notice] = "book taken"
    redirect_to user_assistance_path(@user, @meeting)
  end

  def untake_book
    @user = User.find(params[:user_id])
    @meeting = Meeting.find(params[:assistance_id])
    @book = Book.find(params[:format])
    @assistance = Assistance.where(user_id: @user.id.to_s, meeting_id: @meeting.id.to_s).last
    @assistance.books.delete(@book.id)
    @assistance.save
    flash[:notice] = "book Removed"
    redirect_to user_assistance_path(@user, @meeting)
  end
end