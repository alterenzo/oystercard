require 'Journey.rb'

class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
    @journey_history = []
  end

#@journey.entry_station = entry_station
  def start(entry_station)
    @current_journey = journey_class.new(entry_station)
    entry_station
  end

  def finish(exit_station)
    @current_journey ||= journey_class.new
    @current_journey.set_exit_station(exit_station)
    @journey_history << current_journey
    @current_journey.fare
  end

  def journeys
    @journey_history.dup
  end

  def print_journey_history
    @journey_history.to_s
  end

  private

  attr_reader :journey_class

end
