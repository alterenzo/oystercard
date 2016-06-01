require 'oystercard'
require 'journey'

describe Journey do
  subject(:journey) { described_class.new}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}

  describe'#complete?' do
	  it 'starts a journey' do
      journey.start(entrystation)
      expect(journey.complete?).to eq false
    end
    it 'ends a journey' do
    	journey.start(entrystation)
    	journey.finish(exitstation)
    	expect(journey.complete?).to eq true
    end
  end

  describe '#start' do
  	it 'remembers entry station' do
  	expect(journey.start(entrystation)).to eq entrystation
  end
end

  describe '#finsh' do

    it 'remembers exit station' do
      expect(journey.finish(exitstation)).to eq exitstation
    end
  end



end
