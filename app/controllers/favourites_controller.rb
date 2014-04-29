# Favourites Controller
class FavouritesController < ApplicationController
  def index
    @favourites = current_user.favourites
  end

  def create
    user = User.find(params[:favourite_user_id])
    current_user.favourites << UserHasFavourite.new(user_id: current_user.id, user_favourite_id: user.id)
    @msg = current_user.save ? {status: 'ok', message: 'Success!'} : {status: 'failed', message: 'Error!'}
    respond_to { |format| format.json { render json: @msg } }
  end

  def destroy
    user = User.find(params[:favourite_user_id])
    user_has_favourite = current_user.favourites.where(user_favourite_id: user.id).first
    @msg = user_has_favourite.destroy ? {status: 'ok', message: 'Success!'} : {status: 'failed', message: 'Error!'}
    respond_to { |format| format.json { render json: @msg } }
  end
end
