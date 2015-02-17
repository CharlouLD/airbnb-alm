class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    owner = current_user
    @product = Product.new(product_params)
    @product.owner = owner
    if @product.save
         redirect_to product_path(@product)
       else
         render :new
       end
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :picture, :online, :city, :night_price)
  end

end