class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    movie_ids = params[:bookmark][:movie_id].drop(1)
    comment = params[:bookmark][:comment]
    movie_ids.each do |movie_id|
      movie = Movie.find(movie_id)
      bookmark = Bookmark.new(movie: movie, comment: comment)
      bookmark.list = @list
      bookmark.save
      unless bookmark.save
        # flash.alert = 'Sorry, we are not able to save bookmark.'
        break
      end
    end
    redirect_to list_path(@list), notice: 'Saved bookmark(s)'
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
