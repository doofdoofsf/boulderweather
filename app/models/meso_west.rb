class MesoWest < WeatherService

  def observation(station_id)
    WindObservation.new(1,2,3)
  end
end
