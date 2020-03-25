class DisplayWeatherStation
  def self.stations
    {
        meso_west: {
            sugarloaf: {
                id: 'BTAC2',
                location: '3 miles SW'
            },
            boulder: {
                id: 'E7311',
                location: '2 miles W'
            },
            boulder_airport: {
                id: 'KBDU',
                location: '4 miles ESE'
            },
            nederland: {
                id: 'F1761',
                location: '10 miles SW'
            }
        }
    }
  end

  def self.station_data(name)
    self.stations.values.first.select{|n, _v| n == name}[name]
  end

  def self.station_ids(provider)
    self.stations[provider].values.map{|h| h[:id]}
  end
end