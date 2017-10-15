module Api
  module V1
    class TripsController < ApiController

      def index
        render json: Trip.all 
      end

    end
  end
end
