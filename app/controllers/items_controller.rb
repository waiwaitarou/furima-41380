class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]
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
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(item_params)
      else
        render '/items/edit', status: :unprocessable_entity
      end
  end
  private
  def item_params
    params.require(:item).permit(:sale_name,:explanatation,:cotegory_id,:image,:state_id,:shipping_day_id,:shipping_fee_id,:prefecture_id,:price).merge(user_id: current_user.id)
  end
  def move_to_index
    unless current_user == Item.find(params[:id]).user
      redirect_to '/'
    end
  end
end