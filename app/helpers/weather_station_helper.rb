module WeatherStationHelper
  def google_maps_url(latitude, longitude)
    "https://www.google.com/maps/search/?api=1&query=#{latitude},#{longitude}"
  end

  def station_page_url(provider, station_id)
    url = StationPageURL.new(provider, station_id).url
    raise if url.nil?
    url
  end

  def wind_class(observation)
    observation.compass_direction.include?('W') && observation.gust > 0 ? 'warning' : 'normal'
  end

  def inversion_class(lapse_rate)
    lapse_rate < 0 ? 'good' : 'normal'
  end

  def distance_of_time_in_words(from, to)
    DistanceOfTime.new(to, from).in_words
  end

  class DistanceOfTime
    def initialize(to, from)
      @to = to
      @from = from
    end

    def in_words
      diff > 60 ? (diff / 60.0).round.to_s + ' min' : diff.to_s + ' sec'
    end

    private

    def diff
      (@to.to_time - @from.to_time).round
    end
  end

  class StationPageURL
    def initialize(provider, station_id)
      @provider = provider
      @station_id = station_id
    end

    def url
      urls[@provider]
    end

    private

    def urls
      {
          mesowest: "https://mesowest.utah.edu/cgi-bin/droman/meso_base.cgi?stn=#{@station_id}",
          wunderground: "https://www.wunderground.com/dashboard/pws/#{@station_id}",
          mesalab: "https://archive.eol.ucar.edu/cgi-bin/weather.cgi?site=ml&units=english",
          weatherflow: "https://tempestwx.com/station/25386/graph/#{@station_id}/wind/2"
      }
    end
  end

end
