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
            },
            winter_park: {
                id: 'KCOWINTE9',
                location: '30 miles WSW',
                latitude: 39.84396,
                longitude: -105.783096
            }
        },
        meso_west: {
            nederland: {
                id: 'F1761',
                location: '10 miles SW',
                latitude: 39.98733,
                longitude: -105.44883
            }
        },
        mesa_lab: {
            ncar_mesa_lab: {
                id: 'ncar_mesa_lab',
                location: '5 miles SSE',
                latitude: 39.978285,
                longitude: -105.275084
            },
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