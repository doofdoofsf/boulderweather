class WeatherService
  def initialize(station_ids)
    @station_ids = station_ids
  end

  def observation(station_id, station_name)
    WindObservation.new(self.class.to_s.downcase.to_sym,
                        station_id,
                        station_name,
                        wind_gust(station_id),
                        wind_speed(station_id),
                        wind_direction(station_id),
                        observation_time(station_id))
  rescue
    nil
  end

  private

  def response(station_id)
    @response ||= {}
    return @response[station_id] if @response.has_key?(station_id)

    @response[station_id] = JSON.parse(raw_response(station_id).body)
  end

  def raw_response(station_id)
    RestClient.get(query_url, query_args(station_id))
  end

end
