module Api
  module V1

    class TripSerializer < ActiveModel::Serializer

      attributes  :id, :set_name, :approved, :set_name, :row_number, :request_url
      belongs_to :origin
      belongs_to :destination
      has_many :itineraries

    end

  end
end