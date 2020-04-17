class MesoWest < WeatherService

  private

  def wind_gust(station_id)
    observations(station_id)['wind_gust_value_1']['value']
  end

  def wind_speed(station_id)
    observations(station_id)['wind_speed_value_1']['value']
  end

  def wind_direction(station_id)
    observations(station_id)['wind_direction_value_1']['value']
  end

  def observation_time(station_id)
    DateTime.parse(observations(station_id)['wind_direction_value_1']['date_time'])
  end

  def observations(station_id)
    station(station_id)['OBSERVATIONS']
  end

  def station(station_id)
    stations.select{ |station| station['STID'] == station_id }.first
  end

  def stations
    response['STATION']
  end

  def response
    @response ||= JSON.parse(raw_response.body)
  end

  def raw_response
    RestClient.get(query_url, query_args)
  end

  def query_args
    {
        params: {
            token: token,
            stid: @station_ids.join(','),
            units: 'speed|mph,temp|f'
        }
    }
  end

  def query_url
    'https://api.synopticdata.com/v2/stations/latest'
  end

  def token
    ENV.fetch('MESOWEST_TOKEN')
  end
end
