class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  def initialize(balance = 0)
    @balance = balance
    @journey_history = {}
  end

  def top_up(amount)
    fail "Balance can not exceed £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entrystation)
    raise "Insufficient balance" if balance < MIN_BALANCE
    @entry_station = entrystation
    @journey_history[@entry_station] = nil
    @entry_station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out(exitstation)
    deduct(MIN_FARE)
    @exit_station = exitstation
    @journey_history[@entry_station] = @exit_station
    @entry_station = nil
    @exit_station
  end

    private

  def deduct(amount)
    @balance -= amount
  end

end
