class MessagesController < ApplicationController
  skip_before_action :authorized, only: [:create]



  def create
    # byebug
    message = Message.new(message_params)
    chat = Chat.find(message_params[:chat_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to chat, serialized_data
      render json: message
    end
  end

  # MessagesChannel.broadcast_to chat, serialized_data
  # head :ok,

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :chat_id)
  end
end
