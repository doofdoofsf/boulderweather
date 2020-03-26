class WeatherStationController < ApplicationController
  def index
    @data = {
        wunderground: wunderground_observations,
        meso_west: meso_west_observations
    }
  end

  private

  # TODO: This could use a little refactoring

  def wunderground_observations
    stations(:wunderground).map { |name, h| wunderground.observation(h[:id], name) }
  end

  def wunderground
    @wunderground ||= Wunderground.new(station_ids(:wunderground))
  end

  def meso_west
    @meso_west ||= MesoWest.new(station_ids(:meso_west))
  end

  def meso_west_observations
    stations(:meso_west).map { |name, h| meso_west.observation(h[:id], name) }
  end

  def station_ids(provider)
    DisplayWeatherStation.station_ids(provider)
  end

  def stations(provider)
    DisplayWeatherStation.stations[provider]
  end
end
