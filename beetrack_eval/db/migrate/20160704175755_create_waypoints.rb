class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.string :vehicle_id
      t.float :latitude
      t.float :longitude
      t.datetime :sent_at
    end
  end
end
