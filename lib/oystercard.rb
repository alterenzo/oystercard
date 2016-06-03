require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(journeylog = JourneyLog.new)
    @balance = 0
    @journeylog = journeylog
  end

  def top_up(amount)
    fail "Balance can not exceed £#{MAX_BALANCE}" if balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entrystation)
    raise "Insufficient balance" if balance < MIN_BALANCE
    raise "Invalid argument!" unless entrystation.respond_to?(:name)
    @journeylog.start(entrystation)
  end

  def touch_out(exitstation)
    raise "Invalid argument!" unless exitstation.respond_to?(:name)


    @journeylog.finish(exitstation)
    deduct(@journeylog.current_journey_fare)
  end

  def journeys
    journey_history = @journeylog.journeys
    p "From #{journey_history[0].entry_station.name} to #{journey_history[0].exit_station.name}"

  end

    private

  def deduct(amount)
    @balance -= amount
  end

end
