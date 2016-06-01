require_relative 'oystercard'

class Journey

	PENALTY_FARE = 6
  MIN_FARE = 2

  def initialize(entrystation = nil)
  	@complete = false
    @entry_station = entrystation
  end

  def finish(exitstation)
  	@complete = true
    @exit_station = exitstation
    self
  end

  def complete?
  	@complete
	end

	def fare
    complete? ? MIN_FARE : PENALTY_FARE
	end

end
