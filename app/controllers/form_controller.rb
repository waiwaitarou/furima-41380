class FormController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @item = Item.find(params[:item_id])
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def form_params
    params.require(:form).permit(:postal_code, :prefecture, :prefecture_No, :building_name, :city, :tel_number, :token ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = "sk_test_f8826a08110005122484c4cd"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
