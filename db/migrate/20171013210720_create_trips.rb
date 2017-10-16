class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :set_name
      t.integer :row_number
      t.string :request_url
      t.boolean :approved
      t.timestamps
    end
  end
end
