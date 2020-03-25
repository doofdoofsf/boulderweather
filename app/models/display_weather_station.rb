class DisplayWeatherStation
  def self.stations
    {
        meso_west: {
            sugarloaf: {
                id: 'BTAC2',
                location: '3 miles SW',
                latitude: 40.018056,
                longitude: -105.361389
            },
            boulder: {
                id: 'E7311',
                location: '2 miles W',
                latitude: 40.06518,
                longitude: -105.32669
            },
            boulder_airport: {
                id: 'KBDU',
                location: '4 miles ESE',
                latitude: 40.0394297,
                longitude: -105.2258217
            },
            nederland: {
                id: 'F1761',
                location: '10 miles SW',
                latitude: 39.98733,
                longitude: -105.44883
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