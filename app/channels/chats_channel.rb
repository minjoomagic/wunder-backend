class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chats_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
 # puts "unsub"
 #  x = Chat.find(params[:id])
 #  x.unsubscribe()
 raise "huh?"
  end
end
