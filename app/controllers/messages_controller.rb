class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    @messages = Message.all
  end

  def show
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :message, :photo)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
