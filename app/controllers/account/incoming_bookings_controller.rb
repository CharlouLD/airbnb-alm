module Account
  class IncomingBookingsController < ApplicationController
    before_action :authenticate_user!

    def index
      @bookings = current_user.bookings
    end

    # def check_out(check_in, night)
    #   # We need to ensure that checking is a date (in days) and not a Time (in seconds)
    #   # Maybe change database into nights
    #   # Put it her or in model?
    #   return check_in + night
    # end
  end
end