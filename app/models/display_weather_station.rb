class DisplayWeatherStation
  def self.stations
    {

        wunderground: {
            north_boulder_ridge: {
                id: 'KCOBOULD45',
                location: 'above launch',
                latitude: 40.05619,
                longitude: -105.301689
            },
            sugarloaf: {
                id: 'KCOBOULD363',
                location: '5 miles WSW',
                latitude: 40.029228,
                longitude: -105.396965
            }
        },
        mesa_lab: {
            ncar_mesa_lab: {
                id: 'ncar_mesa_lab',
                location: '5 miles SSE',
                latitude: 39.978285,
                longitude: -105.275084
            },
        },
        meso_west: {
            sugarloaf_mesowest: {
                id: 'BTAC2',
                location: '3 miles SW',
                latitude: 40.018056,
                longitude: -105.361389
            },
            # boulder: {
            #     id: 'E7311',
            #     location: '2 miles W',
            #     latitude: 40.06518,
            #     longitude: -105.32669
            # },
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

  def self.station_data(provider, name)
    self.stations[provider].select{|n, _v| n == name}[name]
  end

  def self.station_ids(provider)
    self.stations[provider].values.map{|h| h[:id]}
  end
end