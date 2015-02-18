module Account
  class ProductsController < ApplicationController
    layout :account

    def index
      user = current_user
      @products = user.products
    end

    def edit
      @product = Product.find(params[:product_id])
    end

    def update
      owner = current_user
      @product = Product.new(product_params)
      @product.owner = owner
      if @product.save
           redirect_to product_path(@product)
         else
           render :new
         end
    end
  end
end
