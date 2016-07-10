require 'test_helper'

class WaypointTest < ActiveSupport::TestCase
  test "should not save Waypoint without data" do
    waypoint = Waypoint.create
    assert_not waypoint.save
  end
end
