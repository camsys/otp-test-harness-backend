module Api
  module V1
    class TripsController < ApiController

      def index
        render json: Trip.all 
      end

      def create
        @trip = Trip.new(trip_params)
        @trip.origin = Place.create!(origin_params)
        @trip.destination = Place.create!(destination_params)

        if @trip.save
          render json: @trip
        else
          render json: nil
        end
      end
      
      protected
      
      def trip_params
        params.require(:trip).permit(
          :set_name,
          :approved,
          :row_number,
          :request_url
        )
      end

      def origin_params
        params.require(:origin).permit(:approved, :lat, :lng, :description, :google_place_id)
      end

      def destination_params
        params.require(:destination).permit(:approved, :lat, :lng, :description, :google_place_id)
      end

    end
  end
end
