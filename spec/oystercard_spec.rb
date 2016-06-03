require 'oystercard'


describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:top_up_amount) {Journey::MIN_FARE + 1}
  let(:entrystation) {double :station, name: "entry"}
  let(:exitstation) {double :station, name: "exit"}
  let(:nonstation) {double :nonstation}


  describe '#balance' do
    it 'allows user to see starting balance of zero' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up oystercard' do
  		expect{oystercard.top_up(1)}.to change{oystercard.balance}.by 1
  	end

    it 'raises an error if balance exceeds max limit' do
      oystercard.top_up(Oystercard::MAX_BALANCE)
      message = "Balance can not exceed £#{Oystercard::MAX_BALANCE}"
      expect{oystercard.top_up(1)}.to raise_error message
    end
  end

  describe '#touch_in' do
    it 'raises an error if the balance is insufficient' do
      message = "Insufficient balance"
      expect{oystercard.touch_in(entrystation)}.to raise_error message
    end
    it 'raises an error if paramater does not respond to name' do
      oystercard.top_up(top_up_amount)
      message = "Invalid argument!"
      expect{oystercard.touch_in(nonstation)}.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'reduces the balance by minimum fare' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      expect{oystercard.touch_out(exitstation)}.to change{oystercard.balance}.by(-Journey::MIN_FARE)
    end
  end

  describe '#journeys' do
    it 'prints journey history' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      oystercard.touch_out(exitstation)
      expect(oystercard.journeys).to eq "From entry to exit"
    end
  end

end
