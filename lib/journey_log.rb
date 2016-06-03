require_relative 'journey'

class JourneyLog

  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = nil
  end

  def start(entrystation)

    @current_journey = @journey_class.new(entrystation)

  end

  def finish(exitstation)
    current_journey
    @current_journey.finish(exitstation)
    @journeys << @current_journey
    # @current_journey = nil
  end


  def current_journey_fare
    0 if @current_journey.nil?
    complete? ? Journey::MIN_FARE : Journey::PENALTY_FARE
  end

  private

  def complete?
  	!!@current_journey.entry_station && !!@current_journey.exit_station
	end


  def current_journey
    @current_journey ||= @journey_class.new
  end

end
