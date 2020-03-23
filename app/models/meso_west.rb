class MesoWest < WeatherService

  def observation(id)
    WindObservation.new(wind_gust(id),
                        wind_speed(id),
                        wind_direction(id),
                        observation_time(id))
  end

  private

  def wind_gust(id)
    observations(id)['wind_gust_value_1']['value']
  end

  def wind_speed(id)
    observations(id)['wind_speed_value_1']['value']
  end

  def wind_direction(id)
    observations(id)['wind_direction_value_1']['value']
  end

  def observation_time(id)
    DateTime.parse(observations(id)['wind_direction_value_1']['date_time'])
  end

  def observations(id)
    station(id)['OBSERVATIONS']
  end

  def station(id)
    stations.select{ |station| station['STID'] == id }.first
  end

  def stations
    response['STATION']
  end

  def response
    @@response ||= JSON.parse(raw_response.body)
  end

  def raw_response
    RestClient.get(query_url, query_args)
  end

  def query_args
    {
        params: {
            token: token,
            stid: @station_ids.join(',')
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
