class OrdersController < ApplicationController

  def index 
    @items = Itme.all
  end
end
