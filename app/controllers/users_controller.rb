class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @books = user.books.order("created_at DESC")
  end
end
