require 'station'

describe Station do
  subject(:station) { described_class.new(:name, :zone) }


  describe '#zone' do
    it 'reports the zone' do
      expect(station.zone).to eq :zone
    end
  end
end
