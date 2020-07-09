class MesaLab < WeatherService

  private

  def wind_gust(_station_id)
    wind_speed_data(37)
  end

  def wind_speed(_station_id)
    wind_speed_data(32)
  end

  def wind_direction(_station_id)
    data_table.css('td')[47].text[/[^°]+/].to_f
  end

  def air_temp(_station_id)
    data_table.css('td')[7].text[/[^°]+/].to_f
  end

  def observation_time(_station_id)
    raw_observation_time.in_time_zone('America/Denver').utc
  end

  def wind_speed_data(element_number)
    data_table.css('td')[element_number].text.delete(' mph').to_f
  end

  def raw_observation_time
    data_table.css('th')[2].text.tr('(','').tr(')','')
  end

  def data_table
    response.css('//table')[2]
  end

  def response
    @response ||= Nokogiri::HTML.parse(raw_response.body)
  end

  def raw_response
    RestClient.get(query_url, query_args)
  end

  def query_args
    {
        params: {
            site: 'ml',
            units: 'english'
        }
    }
  end

  def query_url
    'https://archive.eol.ucar.edu/cgi-bin/weather.cgi'
  end

end