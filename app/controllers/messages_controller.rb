class MessagesController < ApplicationController
  before_action :set_chat_group, only: [:index, :create]

  def index
    @chat_groups = current_user.chat_groups
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
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

    def set_chat_group
      @chat_group = ChatGroup.find(params[:chat_group_id])
    end

end
