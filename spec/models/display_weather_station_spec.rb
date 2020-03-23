require "rails_helper"

RSpec.describe DisplayWeatherStation, :type => :model do
  describe "#stations" do
    before do
      @stations = DisplayWeatherStation.stations[:meso_west]
    end

    it "gives a list of meso_west stations" do
      expect(@stations).to have_key(:nederland)
      expect(@stations).to have_value('F1761')
    end
  end
end