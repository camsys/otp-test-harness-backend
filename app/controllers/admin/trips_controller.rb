module Admin
  class TripsController < ApplicationController

    def index
      @trips = Trip.all 
    end

    def approved
      @trips = Trip.approved
    end

    def not_approved
      @trips = Trip.not_approved
    end

     def show
      @trip = Trip.find(params[:id])
    end
    
  end
end