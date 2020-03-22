require 'test_helper'

class WeatherStationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_station_index_url
    assert_response :success
  end

end
