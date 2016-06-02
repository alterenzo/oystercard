require 'journey_log'


describe JourneyLog do

  subject(:journey_log) { described_class.new}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey, set_exit_station: nil, entry_station: entry_station, exit_station: exit_station, fare: 1}
  let(:entry_station) {double :station, zone: 1}
  let(:exit_station) {double :station, zone: 1}



  describe "#start" do

    it "Will report where the journey starts" do
      expect(journey_log.start(entry_station)).to eq entry_station
    end

    it "Will create a new journey" do
      journey_log.start(entry_station)
      expect(journey_log.current_journey).not_to be_nil
    end
  end

  describe "#finish" do

    it "Creates a new journey if no entry" do
      journey_log.finish(exit_station)
      expect(journey_log.current_journey).not_to be_nil
    end
  end

  describe "#journeys" do 
    it "returns the journey history" do
      journey_log = JourneyLog.new(journey_class)
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journeys).to eq [journey]
    
    end
  end

end
