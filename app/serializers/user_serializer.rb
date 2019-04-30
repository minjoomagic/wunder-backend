class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :phone_number, :items, :id

  def items
      self.object.items
    end

end
