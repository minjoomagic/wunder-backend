class ItemsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]
  # before_action :authorized, only: [:create]

  def index
    @items = Item.all
    render json: @items
  end

  def show
  end

  def new
  end

  def create
    name = params["item"]["name"]
    price = params["item"]["price"]
    description = params["item"]["description"]
    image_url = params["item"]["image_url"]
    category = Category.find_by(name: params["item"]["category"])
    sold_by = params["item"]["sold_by"]
    @item = Item.create(name: name, price: price, description: description, image_url: image_url, category: category, sold_by: sold_by)
    @user = User.find_by(username: params["user"]["username"])
    @user_item = UserItem.create(user: @user, item: @item)
    render json: @item
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
