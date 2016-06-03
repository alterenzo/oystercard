require 'oystercard'
require 'journey'

describe Journey do
  subject(:journey) { described_class.new(entrystation)}
  subject(:journey2) { described_class.new}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}

  describe'#complete?' do
	  it 'start a journey' do
      expect(journey.complete?).to eq false
    end
    it 'ends a journey' do
    	journey.finish(exitstation)
    	expect(journey.complete?).to eq true
    end
  end

  describe '#finish' do
    it 'remembers exit station' do
      expect(journey.finish(exitstation)).to eq exitstation
    end
  end

  describe '#fare' do
    it 'calculates fare of journey' do
      journey.finish(exitstation)
      expect(journey.fare).to eq Journey::MIN_FARE
    end
    it 'charges penalty fare if no exit station' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'charges penalty fare if no entry station' do
      journey.finish(exitstation)
      expect(journey2.fare).to eq Journey::PENALTY_FARE
    end

  end



end
