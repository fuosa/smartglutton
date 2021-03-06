class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]



  def index 
    @order_info = OrderInfo.new
  end


  def create
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      @order_info.save
      redirect_to root_path
    else
      render :index
    end


    # @order = Order.create(order_params)
    # OrderedItem.create(ordered_item_params)
    # redirect_to root_path
  end

  private

  def order_params
    params.require(:order_info).permit(:item_qty, :payment_type, :received_type, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.permit(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def ordered_item_params 
  #   params.permit(:item_qty, :payment_type, :received_type, :phone).merge(order_id: @order.id)


  def set_item
    @item = Item.find(params[:item_id])
  end

end