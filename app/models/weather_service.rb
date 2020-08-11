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
                        air_temp(station_id),
                        observation_time(station_id),
                        :good)
  rescue
    WindObservation.new(self.class.to_s.downcase.to_sym,
                        station_id,
                        station_name,
                        0.0,
                        0.0,
                        0,
                        0,
                        Time.now,
                        :bad)
  end

  private

  def response(station_id)
    @response ||= {}
    return @response[station_id] if @response.has_key?(station_id)

    @response[station_id] = JSON.parse(raw_response(station_id).body)
  end

  def raw_response(station_id)
    RestClient::Request.execute(method: :get,
                                url: query_url,
                                headers: {params: query_args(station_id)[:params]},
                                timeout: 3)
  end

end
