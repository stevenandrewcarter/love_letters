# Controller for the Messages Model
class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      update_message_links
      redirect_to user_messages_path(current_user)
    else
      render :new
    end
  end

  def destroy
    message = Message.find(params[:id])
    msg = {status: message.destroy, message: message.errors.full_messages}
    respond_to { |format| format.json { render json: msg } }
  end

  def index
    @messages = current_user.received_messages
  end

  def new
    @recipient = User.find(params[:recipient_id]) if params[:recipient_id]
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
    @message.mark_as_read
    @reply_message = Message.new(title: "re:#{@message.title}")
    @sender = @message.sent_message.sender
  end

  private

  def update_message_links
    @sender = current_user
    @receiver = User.where(username: params[:message][:recipient]).first
    @sender.sent_messages << SentMessage.new(message_id: @message.id, recipient_id: @receiver.id)
    @sender.save
    @receiver.received_messages << ReceivedMessage.new(message_id: @message.id, sender_id: @sender.id)
    @receiver.save
  end

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
