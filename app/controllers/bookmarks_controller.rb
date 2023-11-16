class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(book_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path
  end

  def delete
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark was successfully deleted.'
  end

  private

  def book_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
