require 'oystercard'
require 'journey'

describe Journey do
  subject(:journey) { described_class.new(oystercard = Oystercard.new)}
  let(:top_up_amount) {Oystercard::MIN_FARE + 1}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}

  describe'#complete?' do
	  it 'starts a journey' do
      journey.start
      expect(journey.complete?).to eq false
    end
    it 'ends a journey' do
    	journey.start
    	journey.end
    	expect(journey.complete?).to eq true
    end
  end

  describe '#start' do
  	oystercard.top_up(top_up_amount)
  	expect(journey.start(entrystation)).to eq entrystation 
  end


    

it 'remembers entry station' do
      
    end
  



end
