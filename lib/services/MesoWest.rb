module Services
  class MesoWest < WeatherStation
    def observation
      Services::WindObservation.new(1,2,3)
    end
  end
end