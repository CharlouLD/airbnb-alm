class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def index
    @products = Product.all
    @hash = Gmaps4rails.build_markers(@products) do |flat, marker|
          marker.lat flat.latitude
          marker.lng flat.longitude
    #      marker.picture({
    #             "url" => ,
    #             "width" =>  32,
    #             "height" => 32})
          marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
        end
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

  def search
    @products = Product.near("#{params[:search]}", 5)
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :picture, :online, :address, :night_price)
  end

end