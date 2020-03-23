class WindObservation

  attr_reader :station_id, :station_name, :gust, :speed, :direction, :observation_time

  def initialize(station_id, station_name, gust, speed, direction, observation_time)
    @station_id = station_id
    @station_name = station_name
    @gust = gust
    @speed = speed
    @direction = direction
    @observation_time = observation_time
  end

end
