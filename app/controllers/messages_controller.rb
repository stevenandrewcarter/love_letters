class MessagesController < ApplicationController
  def create
    @user = current_user
    @message = @user.sent_messages.create(message_params)
    @message.recipient = User.where(username: params[:message][:recipient]).first
    @message.save!
    redirect_to user_messages_path(@user)
  end

  def index
    @messages = current_user.received_messages
  end

  def new
    @user = current_user
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
