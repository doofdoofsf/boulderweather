class Wunderground < WeatherService

  private

  def wind_gust(station_id)
    station_data(station_id)['imperial']['windGust']
  end

  def wind_speed(station_id)
    station_data(station_id)['imperial']['windSpeed']
  end

  def wind_direction(station_id)
    station_data(station_id)['winddir']
  end

  def observation_time(station_id)
    DateTime.parse(station_data(station_id)['obsTimeUtc'])
  end

  def station_data(station_id)
    response(station_id)['observations'].first
  end

  def query_args(station_id)
    {
        params: {
            apiKey: api_key,
            stationId: station_id,
            numericPrecision: 'decimal',
            format: 'json',
            units: 'e'
        }
    }
  end

  def query_url
    'https://api.weather.com/v2/pws/observations/current'
  end

  def api_key
    ENV.fetch('WUNDERGROUND_API_KEY')
  end
end