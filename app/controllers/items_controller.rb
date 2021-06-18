class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @item = Item.all.order(create_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private 
  def item_params
    params.require(:item).permit(:item_name, :description,:category_name, :category_status, :price, :image).merge(user_id: current_user.id) 
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
