class ItemsController < ApplicationController
before_action :move_to_index, except: [:index, :show]

  def index
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


  private 
  def item_params
    params.require(:item).permit(:item_name, :description, :price, :image).merge(user_id: current_user.id) 
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
