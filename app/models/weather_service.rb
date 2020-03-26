class WeatherService
  def initialize(station_ids)
    @station_ids = station_ids
  end

  def observation(station_id, station_name)
    WindObservation.new(station_id,
                        station_name,
                        wind_gust(station_id),
                        wind_speed(station_id),
                        wind_direction(station_id),
                        observation_time(station_id))
  end

  private

  def response
    @response ||= JSON.parse(raw_response.body)
  end

  def raw_response
    RestClient.get(query_url, query_args)
  end

end
