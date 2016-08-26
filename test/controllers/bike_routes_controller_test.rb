require 'test_helper'

class BikeRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bike_routes_index_url
    assert_response :success
  end

  test "should get show" do
    get bike_routes_show_url
    assert_response :success
  end

  test "should get new" do
    get bike_routes_new_url
    assert_response :success
  end

  test "should get edit" do
    get bike_routes_edit_url
    assert_response :success
  end

  test "should get create" do
    get bike_routes_create_url
    assert_response :success
  end

  test "should get update" do
    get bike_routes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bike_routes_destroy_url
    assert_response :success
  end

end
