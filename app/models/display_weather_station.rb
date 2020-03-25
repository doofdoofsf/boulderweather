class DisplayWeatherStation
  def self.stations
    {
        meso_west: {
            sugarloaf: {
                id: 'BTAC2'
            },
            boulder: {
                id: 'E7311'
            },
            boulder_airport: {
                id: 'KBDU'
            },
            nederland: {
                id: 'F1761'
            }
        }
    }
  end

  def self.station_ids(provider)
    DisplayWeatherStation.stations[provider].values.map{|h| h[:id]}
  end
end