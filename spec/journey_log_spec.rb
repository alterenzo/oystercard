require 'journey_log'

describe JourneyLog do
  subject(:journeylog) {described_class.new(Journey.new)}

  describe '#start' do

  end

  describe
    it 'records a journey' do
      journeylog.start(entrystation)
      journeylog.finish(exitstation)
      expect(journeylog.journeys).to eq [{entrystation => exitstation}]
    end
end
