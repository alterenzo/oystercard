require_relative 'oystercard'

class Journey

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

end
