class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :prefectures_id, :status_id, :burden_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
