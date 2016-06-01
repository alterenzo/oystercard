require_relative 'oystercard'

class Journey

	PENALTY_FARE = 6
  MIN_FARE = 2

  def initialize(entrystation = nil)
    @entry_station = entrystation
  end

  def finish(exitstation)
    @exit_station = exitstation
    self
  end

  def complete?
  	!!@entry_station && !!@exit_station
	end

	def fare
    complete? ? MIN_FARE : PENALTY_FARE
	end

end
