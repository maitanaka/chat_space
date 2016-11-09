class ChatGroupsController < ApplicationController
  before_action :set_chat_group, only: [:edit, :update]

  def index
    @chat_groups = current_user.chat_groups
  end

  def new
    @chat_group = ChatGroup.new
    @chat_group.chat_groups_users.build
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      redirect_to chat_group_messages_path(@chat_group)
    else
      flash.now[:alert] = @chat_group.errors.full_messages.join(",")
      render :new
    end
  end

  def edit
  end

  def update
    @chat_group = ChatGroup.find(params[:id])
    if @chat_group.update(chat_group_params)
      redirect_to root_path
    else
      flash.now[:alert] = @chat_group.errors.full_messages.join(",")
      render :edit
    end
  end

  private
    def chat_group_params
      params.require(:chat_group).permit(
        :group_name,
        chat_groups_users_attributes: [:id, :chat_group_id,
          :user_id])
    end

    def set_chat_group
      @chat_group = ChatGroup.find(params[:id])
    end

end
