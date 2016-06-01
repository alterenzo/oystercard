require 'journey_log'

describe JourneyLog do
  subject(:journeylog) {described_class.new(journey)}
  let(:journey) {Journey.new}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}

  describe '#start' do
    it 'starts a journey' do
      journeylog.start(entrystation)
      expect(journey.start).to eq entrystation
    end
  end

  describe
    it 'records a journey' do
      journeylog.start(entrystation)
      journeylog.finish(exitstation)
      expect(journeylog.journeys).to eq [{entrystation => exitstation}]
    end


end
