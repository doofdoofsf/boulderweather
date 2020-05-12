class DisplayWeatherStation
  def self.stations
    {

        wunderground: {
            north_boulder_ridge: {
                name: 'North Boulder Ridge',
                id: 'KCOBOULD45',
                location: 'above launch',
                latitude: 40.05619,
                longitude: -105.301689,
                elevation: 6500
            },
            sugarloaf: {
                name: "Sugarloaf",
                id: 'KCOBOULD363',
                location: '5 miles WSW',
                latitude: 40.029228,
                longitude: -105.396965,
                elevation: 7693
            },
            winter_park: {
                name: 'Winter Park',
                id: 'KCOWINTE9',
                location: '30 miles WSW',
                latitude: 39.84396,
                longitude: -105.783096,
                elevation: 12060
            }
        },
        meso_west: {
            nederland: {
                name: 'Nederland',
                id: 'F1761',
                location: '10 miles SW',
                latitude: 39.98733,
                longitude: -105.44883,
                elevation: 8251
            }
        },
        mesa_lab: {
            ncar_mesa_lab: {
                name: 'NCAR Mesa Lab',
                id: 'ncar_mesa_lab',
                location: '5 miles SSE',
                latitude: 39.978285,
                longitude: -105.275084,
                elevation: 6184
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