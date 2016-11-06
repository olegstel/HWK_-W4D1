class BooksController < ApplicationController
  def index
      @books = Book.all


    # your code here
  end

  def new
    # your code here
    book = Book.new
  end

  def create
    # your code here
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
       flash.now[:error] = "Could not save book"
      render :action => "new"
    end
  end

  def destroy
    # your code here
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
