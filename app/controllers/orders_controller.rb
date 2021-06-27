class OrdersController < ApplicationController
  before_action :sold_out, only: [:index]

  def index
    @product = Product.find(params[:product_id])
    @record_address = RecordAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index 
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: record_params[:token],  
      currency: 'jpy'
    )
  end

  def sold_out
    redirect_to root_path if @product.purchase_record.present?
  end

end
