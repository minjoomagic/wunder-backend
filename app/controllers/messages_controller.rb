class MessagesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

    def index
      messages = Message.all
        render json: messages
    end


    def create
        # byebug
      user = User.find_by(username: params[:user][:username])
      message = Message.new(text: params[:message][:text], chat_id: params[:message][:chat_id], user_id: user.id)
      chat = Chat.find(message_params[:chat_id])

      # if message.save use if you want messages to persist
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)
        ).serializable_hash
        MessagesChannel.broadcast_to chat, serialized_data
        head :ok
        # ==================================
      if request.headers['special'] === 'flag'
        # byebug
      message2 = "Here is your convo with '#{user.username}' '#{message.text}' "
      TwilioTextMessenger.new(message2).call
      end
    end

    private

    def message_params
      params.require(:message).permit(:text, :chat_id, :user_id)
    end
  end
