class ConversationsController < ApplicationController
  def index
    @conversations = User.find(params[:user_id]).conversations
  end
end
