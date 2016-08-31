require 'test_helper'

class BikeLanesMapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bike_lanes_map_index_url
    assert_response :success
  end

end
