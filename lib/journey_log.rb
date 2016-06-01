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
    @journeys << @current_journey.finish(exitstation)
    @current_journey = nil
  end

  def complete?
    !!@current_journey
  end

end
