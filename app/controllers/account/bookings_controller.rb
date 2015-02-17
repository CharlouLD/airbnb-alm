# TO REMOVE ???
module Account
  class BookingsController < ApplicationController
    layout 'account' # MAX changed syntax layout :account

    def index_outgoing
      # current_user.
    end

    def edit_outgoing

    end

    def update_outgoing
    end

    def index_incoming
      @bookings = current_user.bookings
    end

    def accept_incoming
    end

    def reject_incoming
    end
  end
end