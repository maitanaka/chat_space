class MessagesController < ApplicationController

  def index
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @chat_groups = current_user.chat_groups
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @chat_group = ChatGroup.find(params[:chat_group_id])
    if @message.save
      redirect_to chat_group_messages_path(@chat_group)
    else
      flash.now[:alert] = @message.errors.full_messages.join(",")
      render :index
    end
  end

  private
    def message_params
      params.require(:message).permit(
        :text,
        :user_id,
        :chat_group_id)
    end

end
