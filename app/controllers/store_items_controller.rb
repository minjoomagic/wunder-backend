class StoreItemsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update]
    
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
    store_id = params["store_item"]["store_id"]
    item_id = params["store_item"]["item_id"]
    location = params["store_item"]["location"]
    @store_item = StoreItem.create(store_id: store_id, item_id: item_id, location: location)
    render json: @store_item

  end

  def edit
  end

  def update
  end

  def destroy
  end

end
