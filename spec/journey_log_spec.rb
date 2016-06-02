require 'journey_log'


describe JourneyLog do

  subject(:journey_log) { described_class.new}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}



  describe "#start" do

    it {is_expected.to respond_to(:start)}

    it "Will report where the journey starts" do
      expect(journey_log.start(entry_station)).to eq entry_station
    end

    it "Will create a new journey" do
      journey_log.start(entry_station)
      expect(journey_log.current_journey).not_to be_nil
    end
  end

  describe "#finish" do
    it { is_expected.to respond_to(:finish) }

    it "Will report where the journey ends" do
      expect(journey_log.finish(exit_station)).to eq exit_station
    end

    it "Creates a new journey if no entry" do
      journey_log.finish(exit_station)
      expect(journey_log.current_journey).not_to be_nil
    end
  end


end
