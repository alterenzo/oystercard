require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  let(:zone1_station) {double :station, zone: 1}
  let(:zone2_station) {double :station, zone: 2}
  let(:zone3_station) {double :station, zone: 3}
 

  describe 'Attributes' do
    it 'Is initialized as an empty journey' do
      expect(journey.entry_station || journey.exit_station).to be_nil
    end
  end

  describe '#fare' do
    it 'returns 0 if user did NOT touch_in AND touch_out' do
      expect(journey.fare).to eq 0
    end

    context 'user touched in and touched out' do
      it 'returns the minimum fare' do
        journey = described_class.new(zone1_station)
        journey.set_exit_station(zone1_station)
        expect(journey.fare).to eq Journey::MINIMUM_FARE
      end
    end

    context 'user forgot to touch_in or touch_out' do
      it 'returns the penalty fare' do
        journey.set_exit_station(zone1_station)
        expect(journey.fare).to eq Journey::MAXIMUM_FARE
      end
    end
  end
end
