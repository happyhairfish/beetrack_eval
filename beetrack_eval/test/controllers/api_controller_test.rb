require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get status 200" do
  	post :gps, {latitude: 20.23, longitude: -0.56, sent_at: "2016-06-02 20:45:00", vehicle_identifier: "HA-3452"}
  	assert_equal 200, response.status
  end

  test "should get status 400" do
    post :gps, {latitude: 20.23, sent_at: "2016-06-02 20:45:00", vehicle_identifier: "HA-3452"}
  	assert_equal 400, response.status
  end
end
