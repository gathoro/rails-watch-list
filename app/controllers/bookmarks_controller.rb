class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: 'Movie was successfully bookmarked!'
    else
      render :new, status: :unprocessable_entity
    end
    @bookmark.save
  end

  def destroy
    @bookmark.destroy
    @bookmark = Bookmark.new(bookmark_params)
    redirect_to bookmark_path, notice: 'Bookmark was deleted.', status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
