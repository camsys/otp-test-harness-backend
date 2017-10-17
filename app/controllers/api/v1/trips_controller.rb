module Api
  module V1
    class TripsController < ApiController

      def index
        render json: Trip.all 
      end

      def create
        @trip = Trip.new(trip_params)
        @trip.origin = Place.create!(origin_params["origin"])
        @trip.destination = Place.create!(destination_params["destination"])

        if @trip.save
          itineraries_params["itineraries"].each do |itin|
            new_itinerary = Itinerary.new(itin)
            new_itinerary.trip = @trip
            new_itinerary.save 
          end
          render json: @trip
        else
          render json: nil
        end
      end

      def show
        render json: Trip.find_by_id(params[:id]) 
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
        params.permit(origin: [:approved, :lat, :lng, :description, :google_place_id])
      end

      def destination_params
        params.permit(destination: [:approved, :lat, :lng, :description, :google_place_id])
      end

      def itineraries_params
        params.permit(itineraries: [:approved, :raw])
      end

    end
  end
end
