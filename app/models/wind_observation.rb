class WindObservation

  attr_reader :station_id, :station_name, :gust, :speed, :direction, :observation_time, :compass_direction

  def initialize(station_id, station_name, gust, speed, direction, observation_time)
    @station_id = station_id
    @station_name = station_name
    @gust = gust
    @speed = speed
    @direction = direction
    @observation_time = observation_time
    @compass_direction = compass(direction)
  end

  private

  def compass(degrees)
    compass_points[((degrees / 22.5) + 0.5).to_i % 16]
  end

  def compass_points
    ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE',  'SE',  'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
  end

end
