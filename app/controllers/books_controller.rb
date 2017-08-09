class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text

      format.csv do
        render plain: Book.generate_csv(@books)

      format.json do
          render json: @books.map {|book|
            {title: book.title, author: book.author}
          }
        end
      end
    end
  end
end
