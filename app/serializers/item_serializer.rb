class ItemSerializer < ActiveModel::Serializer
  attributes :name, :id, :users, :category, :price, :image_url, :description, :sold_by, :stores, :store_items
# ​
  # def category
  #   self.object.category.name
  # end

  def user
    self.object.users
  end

  def store
    self.object.stores
  end

end
