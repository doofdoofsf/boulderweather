module WeatherStationHelper
  def distance_of_time_in_words_minutes(from, to)
    mins = distance_of_time_in_minutes(from, to)
    pluralize(mins, 'min')
  end

  def distance_of_time_in_minutes(from, to)
    ((to.to_time - from.to_time) / 60.0).round
  end
end
