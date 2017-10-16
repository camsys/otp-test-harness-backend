module Admin
  class TripsController < ApplicationController

    def index
      @trips = Trip.all 
    end
    
  end
end