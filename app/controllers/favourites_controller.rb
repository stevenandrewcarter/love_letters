# Favourites Controller
class FavouritesController < ApplicationController
  def index
    @favourites = current_user.favourites
  end

  def create
    user = User.find(params[:favourite_user_id])
    current_user.favourites << UserHasFavourite.new(user_id: current_user.id, user_favourite_id: user.id)
    msg = {status: current_user.save, message: current_user.errors.full_messages}
    respond_to { |format| format.json { render json: msg } }
  end

  def destroy
    user = User.find(params[:favourite_user_id])
    user_has_favourite = current_user.favourites.where(user_favourite_id: user.id).first
    msg = {status: user_has_favourite.destroy, message: user_has_favourite.errors.full_messages}
    respond_to { |format| format.json { render json: msg } }
  end
end
