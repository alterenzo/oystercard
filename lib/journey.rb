require_relative 'oystercard'

class Journey

	PENALTY_FARE = 6

  def start(entrystation)
  	@complete = false
    @entry_station = entrystation
  end

  def finish(exitstation)
  	@complete = true
    @exit_station = exitstation
  end

  def complete?
  	@complete
	end

	def fare
		return PENALTY_FARE if @exit_station == nil || @entry_station == nil
		Oystercard::MIN_FARE
	end

end
