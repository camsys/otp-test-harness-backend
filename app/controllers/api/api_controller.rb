module Api
  class ApiController < ApplicationController

    def index
      render json: Trip.all 
    end

  end
end