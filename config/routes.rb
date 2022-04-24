Rails.application.routes.draw do
  get 'weather_station/index'
  get 'observations', to: 'weather_station#observations_api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
