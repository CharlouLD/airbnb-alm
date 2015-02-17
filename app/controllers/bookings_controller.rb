class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    customer = current_user
    @product = Product.find(params[:product_id])
    @booking = @product.bookings.build(booking_params)
    @booking.customer = customer
    if @booking.save
      redirect_to account_da  root_path
    else
      render :new
    end
  end

  def booking_params
      params.require(:booking).permit(:check_in, :message, :night)
  end
end

