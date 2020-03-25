class WeatherStationController < ApplicationController
  def index
    @observations = observations
  end

  private

  def meso_west
    @meso_west ||= MesoWest.new(station_ids)
  end

  def observations
    stations.map { |name, h| meso_west.observation(h[:id], name) }
  end

  def station_ids
    DisplayWeatherStation.station_ids(:meso_west)
  end

  def stations
    DisplayWeatherStation.stations[:meso_west]
  end
end
