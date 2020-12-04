class BooksController < ApplicationController
  def index
    @books = Book.all.order("created_at DESC").first(5)
  end
end