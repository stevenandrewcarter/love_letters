class FavouritesController < ApplicationController
  def index
    @favourites = current_user.favourites
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      current_user.favourites << UserHasFavourite.new(user_id: current_user.id, user_favourite_id: user.id)
      current_user.save
    end
    redirect_to :index
  end
end
