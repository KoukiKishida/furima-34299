class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_product, only: [:edit, :update, :show, :destroy]
  before_action :not_user, only: [:edit, :update, :destroy]
  before_action :record_present, only: [:edit, :update, :destroy]


  def index
    @products = Product.all.order(id: "DESC")
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def update
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

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id,
       :prefecture_id, :status_id, :burden_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def not_user
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def record_present
    redirect_to root_path if @product.purchase_record.present?
  end
end
