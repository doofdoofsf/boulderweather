module WeatherStationHelper
  def distance_of_time_in_words_minutes(from, to)
    mins = distance_of_time_in_minutes(from, to)
    pluralize(mins, 'min')
  end

  def distance_of_time_in_minutes(from, to)
    ((to.to_time - from.to_time) / 60.0).round
  end

  def google_maps_url(latitude, longitude)
    "http://maps.google.com/maps?t=k&q=loc:#{latitude}+#{longitude}"
  end

  def meso_west_station_page_url(station_id)
    "https://mesowest.utah.edu/cgi-bin/droman/meso_base.cgi?stn=#{station_id}"
  end
end
