require 'oystercard'
require 'journey'

describe Journey do
  subject(:journey) { described_class.new(Oystercard.new)}

  describe'#start' do

    it 'starts a journey' do
      journey.start
      expect(journey.in_journey?).to eq true
    end
  end
end
