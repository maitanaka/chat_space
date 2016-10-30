class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all
  end

  def new
  end

  def create
    @message = Message.new(create_messages)
    if @message.save
      redirect_to root_path
    else
      flash.now[:alert] = @message.errors.full_messages.join(",")
      render :index
    end
  end

  private
    def create_messages
      params.require(:message).permit(:text)
    end

end
