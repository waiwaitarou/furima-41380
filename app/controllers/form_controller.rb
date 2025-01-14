class FormController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :set_form, only: [:index, :new]
  def index
    if @item.sell_record or @item.user == current_user
      redirect_to '/'
    end
  end

  def new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def form_params
    params.require(:form).permit(:postal_code, :region_of_origin, :prefecture_id, :building_name, :city, :tel_number, :token ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

def set_item
  @item = Item.find(params[:item_id])
end

def set_form
  @form = Form.new
end