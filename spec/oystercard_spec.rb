require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  let(:maximum) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum) { Journey::MINIMUM_FARE }
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:zone1_station) {double :station, zone: 1}
  let(:zone2_station) {double :station, zone: 2}
  let(:zone3_station) {double :station, zone: 3}
  let(:journey) {double :journey, entry_station: "station_one", exit_station: "station_two"}

  describe "Attributes" do
    it "Has a default balance of 0" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe "#top_up" do
    before { oystercard.top_up(maximum) }
    it "Tops up the balance with the amount passed to top_up" do
  	  expect(oystercard.balance).to eq maximum
    end
    it "Refuses balance over maximum balance" do
  	  expect {oystercard.top_up(minimum)}.to raise_error(
      "ERROR: Balance limit is £ #{maximum}")
    end
  end

  describe "#touch_in" do
    it "Refuses touch_in if balance is less than minimum fare" do
  	  oystercard.top_up(minimum - 1)
  	  expect {oystercard.touch_in(entry_station)}.to raise_error "ERROR: Insufficient funds"
    end
end

  describe "#touch_out" do
    before { oystercard.top_up(maximum) }
    it "Deducts from the balance at touch out" do
      oystercard.touch_in(zone1_station)
      expect{oystercard.touch_out(zone2_station)}.to change{ oystercard.balance }.by -2
    end
    it 'Receives a station as an argument' do
      expect(oystercard).to respond_to(:touch_out).with(1).arguments
    end
  end
end
