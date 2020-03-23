class WindObservation

  attr_reader :gust, :speed, :direction, :observation_time

  def initialize(gust, speed, direction, observation_time)
    @gust = gust
    @speed = speed
    @direction = direction
    @observation_time = observation_time
  end

end
