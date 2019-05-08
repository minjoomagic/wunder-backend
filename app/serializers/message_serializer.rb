class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :text, :user, :created_at

  def user
    self.object.user.username
  end
end
