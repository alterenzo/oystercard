require 'journey_log'

describe JourneyLog do

  subject(:journeylog) {described_class.new(journey_class)}
  
  let(:journey) {double :journey}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}
  let(:journey_class) {double :journey_class, new: journey}

  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entrystation)
      journeylog.start(entrystation)
    end
  end


end
