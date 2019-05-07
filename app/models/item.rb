class Item < ApplicationRecord
  has_many :user_items
  has_many :users, through: :user_items

  has_many :store_items
  has_many :stores, through: :store_items

  has_many :favorites
  has_many :users, through: :favorites
end
