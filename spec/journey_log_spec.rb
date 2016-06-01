require 'journey_log'

describe JourneyLog do
  subject(:journeylog) {described_class.new(journey_class)}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey, finish: exitstation}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}
 
  

  describe '#start' do
    it 'starts a journey' do
      #expect(journeylog.start).to eq entrystation
    end
  end

  describe
    it 'records a journey' do
      #journeylog.start(entrystation)
      #journeylog.finish(exitstation)
      #expect(journeylog.journeys).to include journey
    end


end
