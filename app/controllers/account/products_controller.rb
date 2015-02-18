module Account
  class ProductsController < ApplicationController

    def index
      user = current_user
      @products = user.products
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
           redirect_to product_path(@product)
         else
           render :new
         end
    end

    def product_params
      params.require(:product).permit(:title, :description, :picture, :online, :city, :night_price)
    end
  end
end
