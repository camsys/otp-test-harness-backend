class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :description
      t.decimal :lat
      t.decimal :lng
      t.string :google_place_id
      t.boolean :approved
      t.timestamps
    end
  end
end
