module Account
  class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
      @bookings = []
      @products = current_user.products
      @products.each do | product |
        @bookings << product.bookings
      end
      @bookings.flatten!
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.update(booking_params)
      redirect_to account_bookings_path
    end

  private

    def booking_params
      params.require(:booking).permit(:status)
    end

  end
end