class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:show, :index]


  def index
    @products = Product.all.order(id: "DESC")
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id,
       :prefecture_id, :status_id, :burden_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
