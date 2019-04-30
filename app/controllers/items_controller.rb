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
    @item = Item.create(name: name, price: price, description: description, image_url: image_url, category: category)
    @user = User.find_by(username: params["user"]["username"])
    @user_item = UserItem.create(user: @user, item: @item)
    render json: @item
  end

  def edit
  end

  def update
    item = Item.find(params["item"]["id"])
    item.sold = true
    item.save
    seller = User.find_by(username:params["item"]["users"][0]["username"])
    buyer = User.find_by(username: params["user"]["username"])
    userItem = UserItem.find_by(user_id: seller.id)
    userItem.user_id = buyer.id
    userItem.save
    # render :
    # byebug
  end

  def destroy
  end
end
