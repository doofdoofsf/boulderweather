require "rails_helper"

RSpec.describe MesoWest, :type => :model do
  describe "#observation" do
    before do
      @station = MesoWest.new('abc')
    end

    it "returns an observation" do
      observation = @station.observation
      expect(observation.speed).to eq(1)
    end
  end
end
