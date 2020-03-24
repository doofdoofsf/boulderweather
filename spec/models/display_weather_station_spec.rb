require "rails_helper"

RSpec.describe DisplayWeatherStation, :type => :model do
  describe "#stations" do
    before do
      @stations = DisplayWeatherStation.stations[:meso_west]
    end

    it "gives a list of meso_west stations" do
      expect(@stations).to have_key(:sugarloaf)
      expect(@stations).to have_value('BTAC2')
    end
  end
end