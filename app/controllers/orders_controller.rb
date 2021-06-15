class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index 
  end

  def new 
  end

  def create
  end



  private
  
  # def orderd_item_params
  #   params.require(:ordered_item).permit(:item_qty, :item_status, :payment_type, :received_type, :phone)
  #   .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  # end
end
