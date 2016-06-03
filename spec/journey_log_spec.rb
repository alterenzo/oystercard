require 'journey_log'

describe JourneyLog do

  subject(:journeylog) {described_class.new(journeyclass)}

  let(:journey) {double :journey, finish: ()}

  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}
  let(:journeyclass) {double :journey_class, new: journey}

  describe '#start' do
    it 'starts a journey' do
      expect(journeyclass).to receive(:new).with(entrystation)
      journeylog.start(entrystation)
    end
  end

  describe '#journeys' do
    it 'records a journey' do
      journeylog.start(entrystation)
      journeylog.finish(exitstation)
      expect(journeylog.journeys).to include journey
    end

  end


end
