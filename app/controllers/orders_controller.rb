class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture, :prefecture_No, :building_name, :city, :tel_number, :sale_record, :user, :item)
  end
end
