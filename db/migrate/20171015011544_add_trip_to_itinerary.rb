class AddTripToItinerary < ActiveRecord::Migration[5.0]
  def change
    add_reference :itineraries, :trip, foreign_key: true
  end
end
