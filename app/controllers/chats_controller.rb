class ChatsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]
  def index
    chats = Chat.all
    render json: chats
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChatSerializer.new(chat)
      ).serializable_hash
      ActionCable.server.broadcast 'chats_channel', serialized_data
      head :ok
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:title)
  end
end

def create
    # find user & chef
    # find or create chat
    # find or create instance of UserChat (for both users)
    @user = User.find(params[:user][:user_id])
    @chef = User.find(params[:user][:user_type]["chef"])
    @chat = Chat.find_or_create_by(title: "Chat with #{@user.username.capitalize} and #{@chef.username.capitalize}")
    @user_chat = UserChat.find_or_create_by(chat_id: @chat.id, user_id: @user.id)
    @chef_chat = UserChat.find_or_create_by(chat_id: @chat.id, user_id: @chef.id)
    render json: {user_chat: @user_chat, chef_chat: @chef_chat}
  end
