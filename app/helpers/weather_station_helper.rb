module WeatherStationHelper
  def format_ago_string(string)
    s = string.gsub('minutes', 'mins').gsub('about', '')
  end
end
