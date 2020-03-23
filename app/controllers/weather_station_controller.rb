class WeatherStationController < ApplicationController
  def index
    @observations = observations
  end

  private

  def meso_west
    MesoWest.new(station_ids)
  end

  def observations
    stations.map { |name, id| meso_west.observation(id, name) }
  end

  def station_ids
    stations.values
  end

  def stations
    DisplayWeatherStation.stations[:meso_west]
  end
end
