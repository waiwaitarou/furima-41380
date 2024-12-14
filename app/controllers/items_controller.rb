class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
 
  end

  def new
    @items = Items.new
  end

  def create
    @item = Item.new(item_params)
  end

  def edit
    @item = Item.find(item_params[:id])
  end
end