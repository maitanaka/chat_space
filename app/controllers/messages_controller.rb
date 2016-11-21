class MessagesController < ApplicationController
  before_action :set_chat_group, only: [:index, :create]

  def index
    @chat_groups = current_user.chat_groups
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
          format.html{redirect_to chat_group_messages_path(@chat_group)}
          format.json{render json: @message.to_json(:include => {:user => {:only => :name}})}
      else
        flash.now[:alert] = @message.errors.full_messages.join(",")
        render :index
      end
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
