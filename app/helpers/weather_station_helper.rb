module WeatherStationHelper
  def distance_of_time_in_words_minutes(from, to)
    pluralize(distance_of_time_in_minutes(from, to), 'min')
  end

  def distance_of_time_in_minutes(from, to)
    ((to.to_time - from.to_time) / 60.0).round
  end

  def google_maps_url(latitude, longitude)
    "https://www.google.com/maps/search/?api=1&query=#{latitude},#{longitude}"
  end

  def station_page_url(provider, station_id)
    {
        meso_west: "https://mesowest.utah.edu/cgi-bin/droman/meso_base.cgi?stn=#{station_id}",
        wunderground: "https://www.wunderground.com/dashboard/pws/#{station_id}",
        mesa_lab: "https://archive.eol.ucar.edu/cgi-bin/weather.cgi?site=ml&units=english"
    }[provider]
  end

  def wind_class(observation)
    observation.compass_direction.include?('W') && observation.gust > 0 ? 'warning' : 'normal'
  end

  def inversion_class(lapse_rate)
    lapse_rate < 0 ? 'good' : 'normal'
  end
end
