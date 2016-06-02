require 'Journey.rb'

class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
  end

#@journey.entry_station = entry_station
  def start(entry_station)
    @current_journey = journey_class.new(entry_station)
    entry_station
  end

  def finish(exit_station)
    @current_journey ||= journey_class.new
    exit_station
  end

  private

  attr_reader :journey_class

end
