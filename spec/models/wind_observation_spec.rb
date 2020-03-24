require "rails_helper"

RSpec.describe WindObservation, :type => :model do
  describe "#compass" do
    before do
      @observation = WindObservation.new('F1761', 'Nederland', 3.0, 2.0, 246.0, DateTime.now)
    end

    it "returns some properties" do
      expect(@observation.speed).to eq(2.0)
      expect(@observation.gust).to eq(3.0)
    end

    it "returns a sensible point of the compass" do
      expect(@observation.compass_direction).to eq('WSW')
    end

    it "returns a sensible west component" do
      expect(@observation.west_gust_component.round(1)).to eq(1.8)
    end
  end
end