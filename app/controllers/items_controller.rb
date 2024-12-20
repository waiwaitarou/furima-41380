class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @item = Item.find(params[:id])
    if @item.present?
      @value = @item[:some_key]
    else
      @value = nil
    end
  end
  private
  def item_params
    params.require(:item).permit(:sale_name,:explanatation,:cotegory_id,:image,:state_id,:shipping_day_id,:shipping_fee_id,:prefecture_id,:price).merge(user_id: current_user.id)
  end
  def my_items
    @items = current_user.items if user_signed_in?
  end
end