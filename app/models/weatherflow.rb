class Weatherflow < WeatherService

  private

  def wind_gust(station_id)
    station_data(station_id)[3] * ms_to_mph
  end

  def wind_speed(station_id)
    station_data(station_id)[2] * ms_to_mph
  end

  def wind_direction(station_id)
    station_data(station_id)[4]
  end

  def air_temp(station_id)
    station_data(station_id)[7] * 9/5 + 32
  end

  def observation_time(station_id)
    DateTime.strptime(station_data(station_id).first.to_s, '%s')
  end

  def station_data(station_id)
    response(station_id)['obs'].last
  end

  def ms_to_mph
    2.237
  end

  def query_args(station_id)
    {
        params: {
            api_key: 'a8f5dbda-af0a-4b57-99b9-f10baa88f27b',
            device_id: station_id,
            time_start: time_start,
            time_end: time_end
        }
    }
  end

  def time_start
    10.minutes.ago.to_i
  end

  def time_end
    Time.now.to_i
  end

  def query_url
    'https://swd.weatherflow.com/swd/rest/observations'
  end
end