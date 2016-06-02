require_relative 'journey_log.rb'


class Oystercard

  attr_reader :balance
  MAXIMUM_BALANCE = 90

 def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "ERROR: Insufficient funds" if balance < Journey::MINIMUM_FARE
    deduct(@journey_log.start(entry_station))
  end

  def touch_out(exit_station)
    deduct(@journey_log.finish(exit_station))
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
