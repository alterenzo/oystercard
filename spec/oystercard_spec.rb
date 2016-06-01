require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:top_up_amount) {Oystercard::MIN_FARE + 1}
  let(:entrystation) {double(:entrystation)}
  let(:exitstation) {double(:exitstation)}
    
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

  describe '#in_journey?' do
    it 'reports when oystercard is in use' do
      oystercard.top_up(1)
      oystercard.touch_in(entrystation)
      expect(oystercard.in_journey?).to eq true
    end

    it 'reports when oystercard is not in use' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      oystercard.touch_out(exitstation)
      expect(oystercard.in_journey?).to eq false
    end

    it 'reports initialized oystercard not in use' do
      expect(oystercard.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'raises an error if the balance is insufficient' do
      message = "Insufficient balance"
      expect{oystercard.touch_in(entrystation)}.to raise_error message
    end

    it 'remembers entry station' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      expect(oystercard.entry_station).to eq entrystation
    end
  end

  describe '#touch_out' do
    it 'reduces the balance by minimum fare' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      expect{oystercard.touch_out(exitstation)}.to change{oystercard.balance}.by(-Oystercard::MIN_FARE)
    end

    it 'forgets entry station on touch out' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      oystercard.touch_out(exitstation)
      expect(oystercard.entry_station).to eq nil
    end

    it 'remembers exit station' do
      oystercard.top_up(top_up_amount)
      oystercard.touch_in(entrystation)
      oystercard.touch_out(exitstation)
      expect(oystercard.exit_station).to eq exitstation
    end
  end

    describe '#journey_history' do
      it 'responds to method #journey_history' do
        expect(oystercard).to respond_to(:journey_history)
      end
      it 'has no journeys saved by default' do
        expect(oystercard.journey_history).to eq ({})
      end
      it 'records a journey' do
        oystercard.top_up(top_up_amount)
        oystercard.touch_in(entrystation)
        oystercard.touch_out(exitstation)
        expect(oystercard.journey_history).to eq ({entrystation => exitstation})
      end
    end

end
