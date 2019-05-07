class FavoritesController < ApplicationController
skip_before_action :authorized, only: [:index, :create, :update]

    def index
      @favorites = Favorite.all
      render json: @favorites
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
      @item = Item.find_by(id: params["item"]["item"]["id"])
      @user = User.find_by(username: params["user"]["username"])
      @favorite = Favorite.find_or_create_by(user: @user, item: @item)
      render json: @favorite
      # byebug
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
