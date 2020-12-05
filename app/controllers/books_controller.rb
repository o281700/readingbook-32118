class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @books = Book.includes(:user).order("created_at DESC").first(5)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :author, :impression
    ).merge(user_id: current_user.id)
  end
end
