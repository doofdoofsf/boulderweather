class Wunderground < WeatherService

  private

  def wind_gust(_station_id)
    station_data['imperial']['windGust']
  end

  def wind_speed(station_id)
    station_data['imperial']['windSpeed']
  end

  def wind_direction(station_id)
    station_data['winddir']
  end

  def observation_time(station_id)
    DateTime.parse(station_data['obsTimeUtc'])
  end

  def station_data
    response['observations'].first
  end

  def query_args
    {
        params: {
            apiKey: api_key,
            stationId: @station_ids.first,
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