class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @books = Book.includes(:user).order("created_at DESC")
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
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end

  def edit
    redirect_to root_path if current_user.id != @book.user.id
  end

  def update
    if @book.update(book_params)
      redirect_to user_path(@book.user.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :author, :impression
    ).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
