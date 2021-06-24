class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index 
  end

  def new 
  end


  def create
    @order = Order.create(order_params)
    OrderedItem.create(ordered_item_params)
    redirect_to root_path
  end


  private

  def order_params
    params.permit(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def ordered_item_params 
    params.permit(:item_qty, :payment_type, :received_type, :phone).merge(order_id: @order.id)
  end

end
