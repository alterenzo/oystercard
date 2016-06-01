require_relative 'oystercard'

class Journey

  def initialize(oystercard)
    @oystercard = oystercard
  end

  def start
  	@complete = false
  end

  def end
  	@complete = true
  end

  def complete?
  	@complete
	end

end
