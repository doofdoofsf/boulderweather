class DisplayWeatherStation
  def self.stations
    {
        holfuy: [
            {
                name: 'North Boulder Ridge',
                priority: 1,
                id: '1321',
                location: 'above launch',
                latitude: 40.05619,
                longitude: -105.301689,
                elevation: 6500
            }
        ],
        wunderground: [
            {
                name: 'BoulderCAST',
                priority: 2,
                id: 'KCOBOULD199',
                location: '0.5 miles NE',
                latitude: 40.059174,
                longitude: -105.281441,
                elevation: 5600
            },
            {
                name: "Sugarloaf",
                id: 'KCOBOULD363',
                priority: 3,
                location: '5 miles WSW',
                latitude: 40.029228,
                longitude: -105.396965,
                elevation: 7693
            },
            # {
            #   name: "Nederland",
            #   id: 'KCONEDER107',
            #   priority: 4,
            #   location: '10 miles SW',
            #   latitude: 39.98,
            #   longitude: -105.57,
            #   elevation: 9895,
            # },
            {
                name: 'Winter Park',
                priority: 5,
                id: 'KCOWINTE9',
                location: '30 miles WSW',
                latitude: 39.84396,
                longitude: -105.783096,
                elevation: 12060
            }
        ],
        meso_west: [
            {
                name: 'Nederland',
                priority: 4,
                id: 'F1761',
                location: '10 miles SW',
                latitude: 39.98733,
                longitude: -105.44883,
                elevation: 8251
            }
        ],
        mesa_lab: [
            {
                name: 'NCAR Mesa Lab',
                priority: 2,
                id: 'ncar_mesa_lab',
                location: '5 miles SSE',
                latitude: 39.978285,
                longitude: -105.275084,
                elevation: 6184
            },
        ]
    }
  end

  def self.station_priority(station_id)
    station_data(station_id)[:priority]
  end

  def self.station_data(station_id)
    self.stations.values.flatten.find{|station| station[:id] == station_id}
  end

  def self.station_ids(provider)
    self.stations[provider].map{|station| station[:id]}
  end
end