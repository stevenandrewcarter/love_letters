# Search Controller
class SearchController < ApplicationController
  def index
    @search_result = []
    if params[:query]
      @search_result = User.where('username like ?', "%#{params[:query]}%")
    end
  end
end
