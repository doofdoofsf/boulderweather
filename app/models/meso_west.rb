class MesoWest < WeatherStation
  def observation
    WindObservation.new(1,2,3)
  end
end
