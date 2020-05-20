class WeatherStationController < ApplicationController
  def index
    @observations = wunderground_observations + meso_west_observations + mesa_lab_observations
  end

  private

  def mesa_lab_observations
    stations(:mesa_lab).map { |station| mesa_lab.observation(station[:id], station[:name]) }
  end

  def wunderground_observations
    stations(:wunderground).map { |station| wunderground.observation(station[:id], station[:name]) }
  end

  def mesa_lab
    @mesa_lab ||= MesaLab.new(station_ids(:mesa_lab))
  end

  def wunderground
    @wunderground ||= Wunderground.new(station_ids(:wunderground))
  end

  def meso_west
    @meso_west ||= MesoWest.new(station_ids(:meso_west))
  end

  def meso_west_observations
    stations(:meso_west).map { |station| meso_west.observation(station[:id], station[:name]) }
  end

  def station_ids(provider)
    DisplayWeatherStation.station_ids(provider)
  end

  def stations(provider)
    DisplayWeatherStation.stations[provider]
  end
end
