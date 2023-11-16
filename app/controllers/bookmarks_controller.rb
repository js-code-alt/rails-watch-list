class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(book_paramas)
    @bookmark.save
    redirect_to lists_path
  end

  def delete
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark was successfully deleted.'
  end


  private

  def book_paramas
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
