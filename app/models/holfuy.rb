class Holfuy < WeatherService

  private

  def wind_gust(station_id)
    station_data(station_id)['wind']['gust']
  end

  def wind_speed(station_id)
    station_data(station_id)['wind']['speed']
  end

  def wind_direction(station_id)
    station_data(station_id)['wind']['direction']
  end

  def air_temp(station_id)
    station_data(station_id)['temperature']
  end

  def observation_time(station_id)
    DateTime.now.utc - station_data(station_id)['secondsBack']
  end

  def station_data(station_id)
    response(station_id)['measurements'][0]
  end

  def query_args(station_id)
    {
        params: {
            pw: api_key,
            s: station_id,
            m: 'JSON',
            tu: 'F',
            su: 'mph',
            utc: 'utc'
        }
    }
  end

  def query_url
    'http://api.holfuy.com/archive/'
  end

  def api_key
    ENV.fetch('HOLFUY_API_KEY')
  end

  def raw_response(station_id)
    RestClient::Request.execute(method: :get,
                                url: query_url+'?'+query_args(station_id)[:params].to_query,
                                timeout: 3)
  end
end
