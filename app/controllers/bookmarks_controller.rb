class BookmarksController < ApplicationController
  def create
    @user = current_user
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = @user
    if @bookmark.save
      redirect_to @bookmark.city, notice: "💖 #{@bookmark.city.name} a été ajoutée à vos favoris."
    end
    authorize @bookmark
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.city, notice: "💔 #{@bookmark.city.name} a été supprimée de vos favoris."
    authorize @bookmark
  end

  private

  def bookmark_params
    params.permit(:city_id)
  end
end
