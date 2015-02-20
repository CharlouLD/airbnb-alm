module Account
  class BookingsController < ApplicationController
    before_action :authenticate_user!
    # after_update :send_response_email

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
      send_response_email
      redirect_to account_bookings_path
    end

  private

    def booking_params
      params.require(:booking).permit(:status)
    end

    def send_response_email
      @booking = Booking.find(params[:id])
      # raise
      UserMailer.booking_accepted(@booking.customer).deliver if @booking.status == true
      UserMailer.booking_rejected(@booking.customer).deliver if @booking.status == false
    end

  end
end