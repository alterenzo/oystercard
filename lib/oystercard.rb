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

  def touch_in
    raise "Insufficient balance" if balance < MIN_BALANCE
  end

  def touch_out
    deduct(MIN_FARE)
  end

    private

  def deduct(amount)
    @balance -= amount
  end

end
