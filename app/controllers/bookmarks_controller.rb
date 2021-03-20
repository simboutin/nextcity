class BookmarksController < ApplicationController
  def create
    @user = current_user
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = @user
    if @bookmark.save
      redirect_to @bookmark.city, notice: 'Ville ajoutée en favoris'
    end
    authorize @bookmark
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.city, notice: 'Ville supprimée des favoris'
    authorize @bookmark
  end

  private

  def bookmark_params
    params.permit(:city_id)
  end
end
