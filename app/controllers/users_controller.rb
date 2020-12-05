class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @books = current_user.books.order("created_at DESC")
  end
end
