module BooksHelper
  def book_ranking
    Book.group(:title).order('count_all DESC').count
  end
end
