class StoreItemsController < ApplicationController
  def index
    @store_items = StoreItem.all
    render json: @store_items
  end

  def show
  end

  def new
  end

  def create
    # find user
    # user = User.find_by(username: params["username"])

    # find item
    # create user_item
    byebug
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
