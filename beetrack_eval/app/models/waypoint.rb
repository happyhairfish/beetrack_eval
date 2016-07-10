class Waypoint < ActiveRecord::Base
  validates :vehicle_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :sent_at, presence: true
end
