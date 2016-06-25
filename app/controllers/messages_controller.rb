class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new

  end

  def create
    # raise params.inspect
    message = Message.new(message_params)
    message.user = current_user
    message.save

    redirect_to message_path(message)
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy

  end
  protected

  def message_params
    params.require(:message).permit(:title, :body)
  end

end
