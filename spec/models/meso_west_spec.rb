require "rails_helper"

RSpec.describe MesoWest, :type => :model do
  describe "#observation" do
    before do
      @meso_west = MesoWest.new(DisplayWeatherStation.station_ids(:meso_west).first(3))
    end

    describe "ward" do
      before do
        @observation = @meso_west.observation('KBDU', 'boulder_airport')
      end

      it "returns an speed" do
        expect(@observation.speed).to be_instance_of(Float)
        expect(@observation.speed).to be_between(0.0, 100.0)
      end

      it "returns a gust" do
        expect(@observation.gust).to be_instance_of(Float)
        expect(@observation.gust).to be_between(0.0, 100.0)
      end

      it "returns a direction" do
        expect(@observation.direction).to be_instance_of(Float)
        expect(@observation.direction).to be_between(0.0, 360.0)
      end

      it "returns an observation time" do
        expect(@observation.observation_time).to be_instance_of(DateTime)
      end

      it "returns an observation time less than one hour old" do
        diff_in_seconds = ((DateTime.now - @observation.observation_time) * 24 * 60 * 60).to_i
        expect(diff_in_seconds).to be < 1.hour.to_i
      end
    end

    describe "boulder" do
      before do
        @observation = @meso_west.observation('E7311', 'Boulder')
      end

      it "returns an speed" do
        expect(@observation.speed).to be_instance_of(Float)
        expect(@observation.speed).to be_between(0.0, 100.0)
      end
    end
  end
end
