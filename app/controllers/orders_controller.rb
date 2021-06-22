class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]



  def index 
    @order_info = OrderInfo.new
  end
  
  def 




  def create
    @order_info = OrderInfo.new(order_info_params)
    if @order_info.valid?
      @order_info.save
      redirect_to root_path
    else
      render 'index'
    end
  end



  private

  def order_info_params
      params.require(:order_info).permit(:item_qty_id, :payment_type_id, :received_type_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
