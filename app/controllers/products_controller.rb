class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def index
    @products = Product.all
    # product_with_coordinate = Product.where(longitude: nil) # Attent to create it through SQL
    product_with_coordinate = @products.select { |p| p.latitude != nil && p.longitude != nil }
    @hash = Gmaps4rails.build_markers(product_with_coordinate) do |product, marker|
          marker.lat product.latitude
          marker.lng product.longitude
    #      marker.picture({
    #             "url" => ,
    #             "width" =>  32,
    #             "height" => 32})
          marker.infowindow render_to_string(partial: "/products/map_box", locals: { product: product })
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