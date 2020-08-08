class WeatherStationController < ApplicationController
  def index
    @observations = sort_observations(clean_observations)
    @inversion = Inversion.new(@observations)
  end

  private

  class Inversion
    def initialize(observations)
      @observations = observations
    end

    def inversion_difference_string
      sprintf('%+d°', inversion_difference)
    end

    def inversion_difference
      ridge.air_temp - boulder.air_temp
    end

    def observation_time
      [boulder.observation_time, ridge.observation_time].min
    end

    private

    def ridge
      station('82375')
    end

    def boulder
      station('KCOBOULD199')
    end

    def station(station_id)
      @observations.find{|o| o.station_id == station_id}
    end
  end

  def clean_observations
    all_observations.reject {|i| i.nil?}
  end

  def all_observations
    weatherflow_observations + wunderground_observations + meso_west_observations + mesa_lab_observations
  end

  def sort_observations(observations)
    observations.sort_by{|o| DisplayWeatherStation.station_priority(o.station_id)}
  end

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

  def weatherflow
    @weatherflow ||= Weatherflow.new(station_ids(:weatherflow))
  end

  def weatherflow_observations
    stations(:weatherflow).map { |station| weatherflow.observation(station[:id], station[:name]) }
  end

  def station_ids(provider)
    DisplayWeatherStation.station_ids(provider)
  end

  def stations(provider)
    DisplayWeatherStation.stations[provider]
  end
end
